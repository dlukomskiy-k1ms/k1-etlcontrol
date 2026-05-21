
--exec [bronze].[GetDatabaseTaskQuery] 27

CREATE   PROCEDURE [bronze].[GetDatabaseTaskQuery]
(
    @TaskKey INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Query NVARCHAR(MAX);

    DECLARE @JobKey INT
    DECLARE @TaskType NVARCHAR(20)
    DECLARE @SourceName NVARCHAR(200)
    DECLARE @SourceType NVARCHAR(50)
    DECLARE @IsWatermarkEnabledFlag BIT
    DECLARE @PrimaryKeyColumnList NVARCHAR(1000)
    DECLARE @BronzeSchemaName NVARCHAR(2000)
    DECLARE @BronzeTableName NVARCHAR(2000)
    DECLARE @WatermarkColumn NVARCHAR(2000)
    DECLARE @HighWatermarkValue NVARCHAR(200)
    DECLARE @IsWatermarkRowVersionType BIT
    DECLARE @SourceWhereClause NVARCHAR(MAX)
    DECLARE @SourceDatabaseName NVARCHAR(200)
    DECLARE @SourceSchemaName NVARCHAR(200)
    DECLARE @SourceTableName NVARCHAR(200)
    DECLARE @OverrideQuery NVARCHAR(MAX)
    DECLARE @SourceExtractionMethod NVARCHAR(50)

    DECLARE @QuerySelectClause NVARCHAR(MAX)
    DECLARE @QueryFromClause NVARCHAR(400)
    DECLARE @QueryWhereClause NVARCHAR(MAX)

    -- Load task + watermark info
    SELECT
        @SourceName = t.SourceName,
        @SourceType = LOWER(t.SourceType),
        @SourceDatabaseName = ISNULL(t.SourceDatabaseName, ''),
        @SourceSchemaName = ISNULL(t.SourceSchemaName, ''),
        @SourceTableName = ISNULL(t.SourceTableName, ''),
        @PrimaryKeyColumnList = ISNULL(t.PrimaryKeyColumnList, ''),
        @IsWatermarkEnabledFlag = ISNULL(t.IsWatermarkEnabledFlag, 0),
        @WatermarkColumn = ISNULL(t.SinkWatermarkColumn, ''),
        @SourceWhereClause = ISNULL(t.SourceWhereClause, ''),
        @HighWatermarkValue = ISNULL(w.HighWatermarkValue, ''),
        @IsWatermarkRowVersionType = ISNULL(t.IsWatermarkRowVersionType, 0),
        @BronzeSchemaName = t.SinkSchemaName,
        @BronzeTableName = t.SinkTableName,
        @OverrideQuery = t.OverrideQuery,
        @SourceExtractionMethod = LOWER(ISNULL(t.SourceExtractionMethod, ''))
    FROM bronze.Task AS t
    LEFT JOIN bronze.Watermark w
        ON t.TaskKey = w.TaskKey
    WHERE t.TaskKey = @TaskKey;

    -- =====================================================
    -- LEVEL 1: Override query — return immediately
    -- =====================================================
    IF ISNULL(@OverrideQuery, '') <> ''
       OR @SourceExtractionMethod like ('%override%')
    BEGIN
        SELECT @OverrideQuery AS SourceQuery,
               @IsWatermarkEnabledFlag AS IsWatermarkEnabledFlag;
        RETURN;
    END

    -- =====================================================
    -- Build SELECT and source-type-specific FROM clause
    -- (applies to all remaining extraction methods)
    -- =====================================================
    SET @QuerySelectClause = 'SELECT * ';
    SET @QueryWhereClause  = '';

    IF @SourceType = 'snowflake'
    BEGIN
        -- Snowflake: fully qualified DATABASE.SCHEMA.TABLE, no locking hints
        SET @QueryFromClause = ' FROM ' +
            CASE WHEN ISNULL(@SourceDatabaseName, '') <> '' THEN @SourceDatabaseName + '.' ELSE '' END +
            CASE WHEN ISNULL(@SourceSchemaName,   '') <> '' THEN @SourceSchemaName   + '.' ELSE '' END +
            @SourceTableName + ' ';
    END

    IF @SourceType = 'sqlserver'
    BEGIN
        -- SQL Server: SCHEMA.TABLE with NOLOCK hint
        SET @QueryFromClause = ' FROM ' +
            CASE WHEN ISNULL(@SourceSchemaName, '') <> '' THEN UPPER(@SourceSchemaName) + '.' ELSE '' END +
            UPPER(@SourceTableName) + ' WITH (NOLOCK) ';
    END

    -- =====================================================
    -- LEVEL 2: Full extraction — no WHERE, no watermark
    -- =====================================================
    IF @SourceExtractionMethod like ('%full%')
    BEGIN
        SET @Query = @QuerySelectClause + @QueryFromClause;
        SELECT @Query AS SourceQuery, @IsWatermarkEnabledFlag AS IsWatermarkEnabledFlag;
        RETURN;
    END

    -- =====================================================
    -- LEVEL 3: SourceWhereClause (filter)
    -- Applies to 'filter' and 'incremental' methods.
    -- Escape embedded single quotes, handle WHERE prefix.
    -- =====================================================
    IF ISNULL(@SourceWhereClause, '') <> ''
    BEGIN
        IF UPPER(@SourceWhereClause) NOT LIKE 'WHERE %'
            SET @QueryWhereClause = 'WHERE ' + @SourceWhereClause;
        ELSE
            SET @QueryWhereClause = @SourceWhereClause;
    END

    -- =====================================================
    -- LEVEL 4: Watermark
    -- Only if IsWatermarkEnabledFlag = 1 and a value exists.
    -- Appends as WHERE or AND depending on level 3 result.
    -- =====================================================
    IF @IsWatermarkEnabledFlag = 1 AND ISNULL(@HighWatermarkValue, '') <> ''
    BEGIN
        -- Format watermark value per source type
        IF @SourceType = 'snowflake'
        BEGIN
            -- Snowflake: no rowversion concept; always use TO_TIMESTAMP
            SET @HighWatermarkValue = 'TO_TIMESTAMP(''' + @HighWatermarkValue + ''', ''YYYY-MM-DD HH24:MI:SS.FF'')';
        END

        IF @SourceType = 'sqlserver'
        BEGIN
            -- SQL Server: rowversion uses VARBINARY, datetime uses DATETIME2
            IF @IsWatermarkRowVersionType = 1
                SET @HighWatermarkValue = 'CONVERT(VARBINARY(8), ''' + @HighWatermarkValue + ''', 1)';
            ELSE
                SET @HighWatermarkValue = 'CAST(''' + @HighWatermarkValue + ''' AS DATETIME2)';
        END

        -- Append watermark condition — WHERE if no filter clause, AND if one exists
        IF @QueryWhereClause = ''
            SET @QueryWhereClause = 'WHERE ' + @WatermarkColumn + ' > ' + @HighWatermarkValue;
        ELSE
            SET @QueryWhereClause = @QueryWhereClause + ' AND ' + @WatermarkColumn + ' > ' + @HighWatermarkValue;
    END

    -- =====================================================
    -- Combine and return final query
    -- =====================================================
    SET @Query = @QuerySelectClause + @QueryFromClause + @QueryWhereClause;

    SELECT @Query AS SourceQuery, @IsWatermarkEnabledFlag AS IsWatermarkEnabledFlag;
END;

GO

