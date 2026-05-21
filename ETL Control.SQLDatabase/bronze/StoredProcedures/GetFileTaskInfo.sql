CREATE   PROCEDURE [bronze].[GetFileTaskInfo]
(
    @TaskKey INT
)
AS
BEGIN

SET NOCOUNT ON
DECLARE @errorMessage              NVARCHAR(2048)
DECLARE @JobKey                    INT
DECLARE @TaskType                  NVARCHAR(20)
DECLARE @TaskName                  NVARCHAR(150)
DECLARE @SourceName                NVARCHAR(200)
DECLARE @SourceType                NVARCHAR(50)
DECLARE @IsWatermarkEnabledFlag    BIT
DECLARE @SourceLocationKey         INT
DECLARE @SourceFabricConnectionId  NVARCHAR(1000)
DECLARE @PrimaryKeyColumnList      NVARCHAR(1000)
DECLARE @SortByColumnList          NVARCHAR(1000)
DECLARE @RawStoragePath            NVARCHAR(2000)
DECLARE @RawStorageFileName        NVARCHAR(2000)
DECLARE @JsonArrayName             NVARCHAR(1000)
DECLARE @LoadRawToBronzeMethod     VARCHAR(1000)
DECLARE @LoadRawToBronzeNotebookKey INT
DECLARE @LoadRawToBronzeNotebookId   NVARCHAR(1000)
DECLARE @LoadRawToBronzeNotebookName VARCHAR(100)
DECLARE @SinkLocationKey           INT
DECLARE @BronzeWorkspaceName       NVARCHAR(2000)
DECLARE @BronzeLakehouseName       NVARCHAR(2000)
DECLARE @BronzeSchemaName          NVARCHAR(2000)
DECLARE @BronzeTableName           NVARCHAR(2000)
DECLARE @BronzeLoadMethod          NVARCHAR(40)
DECLARE @BronzeWorkspaceId         NVARCHAR(2000)
DECLARE @BronzeLakehouseId         NVARCHAR(2000)
DECLARE @WatermarkColumn           NVARCHAR(2000)

IF NOT EXISTS (SELECT TOP 1 TaskKey FROM bronze.Task WHERE TaskKey = @TaskKey)
BEGIN
    SET @errorMessage = 'Error: Lookup to bronze.Task failed for TaskKey: "' + ISNULL(CONVERT(VARCHAR(20), @TaskKey), 'NULL') + '" Task Not Found in Task Table.';
    THROW 50000, @errorMessage, 1;
END

SELECT TOP 1
     @JobKey                    = t.JobKey
    ,@TaskType                  = t.TaskType
    ,@TaskName                  = t.TaskName
    ,@SourceName                = t.SourceName
    ,@SourceType                = t.SourceType
    ,@IsWatermarkEnabledFlag    = t.IsWatermarkEnabledFlag
    ,@SourceLocationKey         = t.SourceLocationKey
    ,@SourceFabricConnectionId  = src.FabricConnectionId
    ,@PrimaryKeyColumnList      = t.PrimaryKeyColumnList
    ,@SortByColumnList          = t.SortByColumnList
    ,@RawStoragePath            = t.RawStoragePath
    ,@RawStorageFileName        = t.RawStorageFileName
    ,@JsonArrayName             = t.JsonArrayName
    ,@LoadRawToBronzeMethod     = t.LoadRawToBronzeMethod
    ,@LoadRawToBronzeNotebookKey = t.LoadRawToBronzeNotebookKey
    ,@LoadRawToBronzeNotebookId   = lrtbn.NotebookId
    ,@LoadRawToBronzeNotebookName = lrtbn.NotebookName
    ,@SinkLocationKey           = t.SinkLocationKey
    ,@BronzeWorkspaceName       = sl.WorkspaceName
    ,@BronzeWorkspaceId         = sl.WorkspaceId
    ,@BronzeLakehouseName       = sl.LakehouseName
    ,@BronzeLakehouseId         = sl.LakehouseId
    ,@BronzeSchemaName          = t.SinkSchemaName
    ,@BronzeTableName           = t.SinkTableName
    ,@BronzeLoadMethod          = t.SinkLoadMethod
    ,@WatermarkColumn           = t.SinkWatermarkColumn

FROM bronze.Task AS t
INNER JOIN bronze.Locations AS sl
    ON t.SinkLocationKey = sl.LocationKey
LEFT JOIN bronze.Locations AS src
    ON t.SourceLocationKey = src.LocationKey
LEFT JOIN bronze.Notebook AS lrtbn
    ON t.LoadRawToBronzeNotebookKey = lrtbn.NotebookKey
WHERE t.TaskKey = @TaskKey;

SELECT
     @TaskKey                   AS TaskKey
    ,@JobKey                    AS JobKey
    ,@TaskType                  AS TaskType
    ,@TaskName                  AS TaskName
    ,@SourceName                AS SourceName
    ,@SourceType                AS SourceType
    ,@IsWatermarkEnabledFlag    AS IsWatermarkEnabledFlag
    ,@SourceLocationKey         AS SourceLocationKey
    ,@SourceFabricConnectionId  AS SourceFabricConnectionId
    ,ISNULL(@PrimaryKeyColumnList, '') AS PrimaryKeyColumnList
    ,ISNULL(@SortByColumnList, '')     AS SortByColumnList
    ,@RawStoragePath            AS RawStoragePath
    ,@RawStorageFileName        AS RawStorageFileName
    ,@JsonArrayName             AS JsonArrayName
    ,@LoadRawToBronzeMethod     AS LoadRawToBronzeMethod
    ,@LoadRawToBronzeNotebookKey AS LoadRawToBronzeNotebookKey
    ,@LoadRawToBronzeNotebookId   AS LoadRawToBronzeNotebookId
    ,@LoadRawToBronzeNotebookName AS LoadRawToBronzeNotebookName
    ,@SinkLocationKey           AS SinkLocationKey
    ,@BronzeWorkspaceName       AS BronzeWorkspaceName
    ,@BronzeWorkspaceId         AS BronzeWorkspaceId
    ,@BronzeLakehouseName       AS BronzeLakehouseName
    ,@BronzeLakehouseId         AS BronzeLakehouseId
    ,@BronzeSchemaName          AS BronzeSchemaName
    ,@BronzeTableName           AS BronzeTableName
    ,@BronzeLoadMethod          AS BronzeLoadMethod
    ,@WatermarkColumn           AS WatermarkColumn

END

GO

