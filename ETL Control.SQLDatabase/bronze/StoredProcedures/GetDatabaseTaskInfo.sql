CREATE    PROCEDURE [bronze].[GetDatabaseTaskInfo]
    @TaskKey INT
AS
BEGIN
SET NOCOUNT ON;

DECLARE @errorMessage              NVARCHAR(3000)
DECLARE @JobKey                    INT
DECLARE @TaskType                  NVARCHAR(20)
DECLARE @SourceName                NVARCHAR(200)
DECLARE @SourceType                NVARCHAR(50)
DECLARE @IsWatermarkEnabledFlag    BIT
DECLARE @IsWatermarkRowVersionType BIT
DECLARE @SourceLocationKey         INT
DECLARE @NotebookId				   NVARCHAR(250)
DECLARE @NotebookKey	           INT
DECLARE @PrimaryKeyColumnList      NVARCHAR(1000)
DECLARE @SortByColumnList		   NVARCHAR(1000)
DECLARE @SourceDatabaseName        NVARCHAR(200)
DECLARE @SourceSchemaName          NVARCHAR(200)
DECLARE @SourceTableName           NVARCHAR(200)
DECLARE @SourceFabricConnectionId  NVARCHAR(1000)
DECLARE @RawStoragePath            NVARCHAR(2000)
DECLARE @RawStorageFileName        NVARCHAR(2000)
DECLARE @SinkLocationKey           INT
DECLARE @BronzeWorkspaceName       NVARCHAR(2000)
DECLARE @BronzeWorkspaceId         NVARCHAR(2000)
DECLARE @BronzeLakehouseId         NVARCHAR(2000)
DECLARE @BronzeLakehouseName       NVARCHAR(2000)
DECLARE @BronzeWarehouseId         NVARCHAR(2000)
DECLARE @BronzeWarehouseName       NVARCHAR(2000)
DECLARE @BronzeWarehouseSQLString  NVARCHAR(2000)
DECLARE @BronzeSchemaName          NVARCHAR(2000)
DECLARE @BronzeTableName           NVARCHAR(2000)
DECLARE @BronzeLoadMethod          NVARCHAR(40)
DECLARE @WatermarkColumn           NVARCHAR(2000)

IF NOT EXISTS (SELECT TOP 1 TaskKey FROM bronze.Task WHERE TaskKey = @TaskKey)
BEGIN
    SET @errorMessage = 'Error: Lookup to bronze.Task failed for TaskKey: "' + ISNULL(CONVERT(VARCHAR(20), @TaskKey), 'NULL') + '" Task Not Found in Task Table.';
    THROW 50000, @errorMessage, 1;
END

SELECT TOP 1
     @JobKey                    = t.JobKey
    ,@TaskType                  = t.TaskType
    ,@SourceName                = t.SourceName
    ,@SourceType                = t.SourceType
    ,@IsWatermarkEnabledFlag    = t.IsWatermarkEnabledFlag
    ,@IsWatermarkRowVersionType = t.IsWatermarkRowVersionType
    ,@SourceLocationKey         = t.SourceLocationKey
	,@NotebookId				= n.NotebookId
	,@NotebookKey               = t.NotebookKey
    ,@PrimaryKeyColumnList      = t.PrimaryKeyColumnList
	,@SortByColumnList			= t.SortByColumnList
    ,@SourceDatabaseName        = t.SourceDatabaseName
    ,@SourceSchemaName          = t.SourceSchemaName
    ,@SourceTableName           = t.SourceTableName
    ,@SourceFabricConnectionId  = src.FabricConnectionId
    ,@RawStoragePath            = t.RawStoragePath
    ,@RawStorageFileName        = t.RawStorageFileName
    ,@SinkLocationKey           = t.SinkLocationKey
    ,@BronzeWorkspaceName       = sl.WorkspaceName
    ,@BronzeWorkspaceId         = sl.WorkspaceId
    ,@BronzeLakehouseId         = sl.LakehouseId
    ,@BronzeLakehouseName       = sl.LakehouseName
    ,@BronzeWarehouseId         = sl.WarehouseId
    ,@BronzeWarehouseName       = sl.WarehouseName
    ,@BronzeWarehouseSQLString  = sl.WarehouseSQLString
    ,@BronzeSchemaName          = t.SinkSchemaName
    ,@BronzeTableName           = t.SinkTableName
    ,@BronzeLoadMethod          = t.SinkLoadMethod
    ,@WatermarkColumn           = t.SinkWatermarkColumn

FROM bronze.Task AS t
INNER JOIN bronze.Locations AS sl
    ON t.SinkLocationKey = sl.LocationKey
LEFT JOIN bronze.Locations AS src
    ON t.SourceLocationKey = src.LocationKey
LEFT JOIN bronze.Notebook AS n
	on t.NotebookKey = n.NotebookKey
WHERE t.TaskKey = @TaskKey;

SELECT
     @TaskKey                   AS TaskKey
    ,@JobKey                    AS JobKey
    ,@TaskType                  AS TaskType
    ,@SourceName                AS SourceName
    ,@SourceType                AS SourceType
    ,@IsWatermarkEnabledFlag    AS IsWatermarkEnabledFlag
    ,@IsWatermarkRowVersionType AS IsWatermarkRowVersionType
    ,@SourceLocationKey         AS SourceLocationKey
	,@NotebookId			    AS NotebookId
	,@NotebookKey				AS NotebookKey
    ,ISNULL(@PrimaryKeyColumnList, '') AS PrimaryKeyColumnList
	,ISNULL(@SortByColumnList, '')     AS SortByColumnList
    ,@SourceDatabaseName        AS SourceDatabaseName
    ,@SourceSchemaName          AS SourceSchemaName
    ,@SourceTableName           AS SourceTableName
    ,@SourceFabricConnectionId  AS SourceFabricConnectionId
    ,@RawStoragePath            AS RawStoragePath
    ,@RawStorageFileName        AS RawStorageFileName
    ,@SinkLocationKey           AS SinkLocationKey
    ,@BronzeWorkspaceName       AS BronzeWorkspaceName
    ,@BronzeWorkspaceId         AS BronzeWorkspaceId
    ,@BronzeLakehouseId         AS BronzeLakehouseId
    ,@BronzeLakehouseName       AS BronzeLakehouseName
    ,@BronzeWarehouseId         AS BronzeWarehouseId
    ,@BronzeWarehouseName       AS BronzeWarehouseName
    ,@BronzeWarehouseSQLString  AS BronzeWarehouseSQLString
    ,@BronzeSchemaName          AS BronzeSchemaName
    ,@BronzeTableName           AS BronzeTableName
    ,@BronzeLoadMethod          AS BronzeLoadMethod
    ,@WatermarkColumn           AS WatermarkColumn

END

GO

