CREATE   PROCEDURE [bronze].[GetApiTaskInfo]
(
    @TaskKey INT
)
AS
BEGIN

SET NOCOUNT ON
DECLARE @errorMessage              NVARCHAR(2048)
DECLARE @ApiTaskName               NVARCHAR(2000)
DECLARE @TaskType                  NVARCHAR(40)
DECLARE @IsWatermarkEnabledFlag    BIT
DECLARE @ParentSourceName          NVARCHAR(200)
DECLARE @SourceName                NVARCHAR(200)
DECLARE @SourceType                NVARCHAR(500)
DECLARE @SourceLocationKey         INT
DECLARE @SourceAPIURL              NVARCHAR(2500)
DECLARE @NotebookKey               INT
DECLARE @APINotebookID             NVARCHAR(2000)
DECLARE @PrimaryKeyColumnList      NVARCHAR(1000)
DECLARE @SortByColumnList          NVARCHAR(1000)
DECLARE @JsonArrayName             NVARCHAR(1000)
DECLARE @LoadRawToBronzeMethod     VARCHAR(1000)
DECLARE @LoadRawToBronzeNotebookKey INT
DECLARE @LoadRawToBronzeNotebookId   NVARCHAR(1000)
DECLARE @LoadRawToBronzeNotebookName VARCHAR(100)
DECLARE @SinkLocationKey           INT
DECLARE @RawStoragePath            NVARCHAR(2000)
DECLARE @RawStorageFileName        NVARCHAR(2000)
DECLARE @BronzeWorkspaceName       NVARCHAR(2000)
DECLARE @BronzeWorkspaceId         NVARCHAR(2000)
DECLARE @BronzeLakehouseName       NVARCHAR(2000)
DECLARE @BronzeLakehouseId         NVARCHAR(2000)
DECLARE @BronzeWarehouseName       NVARCHAR(2000)
DECLARE @BronzeWarehouseId         NVARCHAR(2000)
DECLARE @BronzeWarehouseSQLString  NVARCHAR(2000)
DECLARE @BronzeSchemaName          NVARCHAR(2000)
DECLARE @BronzeTableName           NVARCHAR(2000)
DECLARE @BronzeLoadMethod          NVARCHAR(40)
DECLARE @SinkWatermarkColumn       NVARCHAR(1000)

IF NOT EXISTS (SELECT TOP 1 TaskKey FROM bronze.Task WHERE TaskKey = @TaskKey)
BEGIN
    SET @errorMessage = 'Error: Lookup to bronze.Task failed for TaskKey: "' + ISNULL(CONVERT(VARCHAR(20), @TaskKey), 'NULL') + '" Task Not Found in Task Table.';
    THROW 50000, @errorMessage, 1;
END

SELECT TOP 1
     @ApiTaskName               = t.TaskName
    ,@TaskType                  = t.TaskType
    ,@IsWatermarkEnabledFlag    = t.IsWatermarkEnabledFlag
    ,@ParentSourceName          = t.ParentSourceName
    ,@SourceName                = t.SourceName
    ,@SourceType                = t.SourceType
    ,@SourceLocationKey         = t.SourceLocationKey
    ,@SourceAPIURL              = src.APIURL
    ,@NotebookKey               = t.NotebookKey
    ,@APINotebookID             = n.NotebookId
    ,@PrimaryKeyColumnList      = t.PrimaryKeyColumnList
    ,@SortByColumnList          = t.SortByColumnList
    ,@JsonArrayName             = t.JsonArrayName
    ,@LoadRawToBronzeMethod     = t.LoadRawToBronzeMethod
    ,@LoadRawToBronzeNotebookKey = t.LoadRawToBronzeNotebookKey
    ,@LoadRawToBronzeNotebookId   = lrtbn.NotebookId
    ,@LoadRawToBronzeNotebookName = lrtbn.NotebookName
    ,@SinkLocationKey           = t.SinkLocationKey
    ,@RawStoragePath            = t.RawStoragePath
    ,@RawStorageFileName        = t.RawStorageFileName
    ,@BronzeWorkspaceName       = sl.WorkspaceName
    ,@BronzeWorkspaceId         = sl.WorkspaceId
    ,@BronzeLakehouseName       = sl.LakehouseName
    ,@BronzeLakehouseId         = sl.LakehouseId
    ,@BronzeWarehouseName       = sl.WarehouseName
    ,@BronzeWarehouseId         = sl.WarehouseId
    ,@BronzeWarehouseSQLString  = sl.WarehouseSQLString
    ,@BronzeSchemaName          = t.SinkSchemaName
    ,@BronzeTableName           = t.SinkTableName
    ,@BronzeLoadMethod          = t.SinkLoadMethod
    ,@SinkWatermarkColumn       = t.SinkWatermarkColumn

FROM bronze.Task AS t
INNER JOIN bronze.Locations AS sl
    ON t.SinkLocationKey = sl.LocationKey
LEFT JOIN bronze.Locations AS src
    ON t.SourceLocationKey = src.LocationKey
LEFT JOIN bronze.Notebook AS n
    ON t.NotebookKey = n.NotebookKey
LEFT JOIN bronze.Notebook AS lrtbn
    ON t.LoadRawToBronzeNotebookKey = lrtbn.NotebookKey
WHERE t.TaskKey = @TaskKey;

SELECT
     @TaskKey                   AS TaskKey
    ,@ApiTaskName               AS ApiTaskName
    ,@TaskType                  AS TaskType
    ,@IsWatermarkEnabledFlag    AS IsWatermarkEnabledFlag
    ,@ParentSourceName          AS ParentSourceName
    ,@SourceName                AS SourceName
    ,@SourceType                AS SourceType
    ,@SourceLocationKey         AS SourceLocationKey
    ,@SourceAPIURL              AS SourceAPIURL
    ,@NotebookKey               AS NotebookKey
    ,@APINotebookID             AS APINotebookId
    ,@PrimaryKeyColumnList      AS PrimaryKeyColumnList
    ,@SortByColumnList          AS SortByColumnList
    ,@JsonArrayName             AS JsonArrayName
    ,@LoadRawToBronzeMethod     AS LoadRawToBronzeMethod
    ,@LoadRawToBronzeNotebookKey AS LoadRawToBronzeNotebookKey
    ,@LoadRawToBronzeNotebookId   AS LoadRawToBronzeNotebookId
    ,@LoadRawToBronzeNotebookName AS LoadRawToBronzeNotebookName
    ,@SinkLocationKey           AS SinkLocationKey
    ,@RawStoragePath            AS RawStoragePath
    ,@RawStorageFileName        AS RawStorageFileName
    ,@BronzeWorkspaceName       AS BronzeWorkspaceName
    ,@BronzeWorkspaceId         AS BronzeWorkspaceId
    ,@BronzeLakehouseName       AS BronzeLakehouseName
    ,@BronzeLakehouseId         AS BronzeLakehouseId
    ,@BronzeWarehouseName       AS BronzeWarehouseName
    ,@BronzeWarehouseId         AS BronzeWarehouseId
    ,@BronzeWarehouseSQLString  AS BronzeWarehouseSQLString
    ,@BronzeSchemaName          AS BronzeSchemaName
    ,@BronzeTableName           AS BronzeTableName
    ,@BronzeLoadMethod          AS BronzeLoadMethod
    ,@SinkWatermarkColumn       AS SinkWatermarkColumn

END

GO

