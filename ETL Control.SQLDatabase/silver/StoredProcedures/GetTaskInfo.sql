CREATE        PROCEDURE [silver].[GetTaskInfo] 
	@TaskKey INT
AS
BEGIN
SET NOCOUNT ON;

DECLARE @errorMessage NVARCHAR(3000)

DECLARE @JobKey INT
DECLARE @TaskName NVARCHAR(250)
DECLARE @TaskType NVARCHAR(250)
DECLARE @SinkWarehouseName NVARCHAR(250)
DECLARE @SinkWarehouseID NVARCHAR(250)
DECLARE @SinkWarehouseSQLConnString NVARCHAR(250)
DECLARE @StoredProcedureSchema NVARCHAR(250)
DECLARE @StoredProcedureName NVARCHAR(250)
DECLARE @NotebookID NVARCHAR(250)
DECLARE @SinkWorkspaceName NVARCHAR(250)
DECLARE @SinkWorkspaceID NVARCHAR(250)
DECLARE @IsWatermarkEnabledFlag BIT
DECLARE @HighWatermarkValue DATETIME2(6)

-- validate TaskAuditKey and throw error if invalid as rest of proc will not work properly
IF NOT EXISTS (SELECT TOP 1 TaskKey FROM gold.Task WHERE TaskKey = @TaskKey)
BEGIN
	SET @errorMessage =  'Error: Lookup to gold.Task failed for TaskKey: "' + ISNULL(CONVERT(VARCHAR(20), @TaskKey), 'NULL') + '" Task Not Found in Task Table.';
	THROW 50000, @errorMessage, 1;
END

SELECT TOP 1
     @JobKey                = t.JobKey
    ,@TaskName              = t.TaskName
    ,@TaskType              = t.TaskType
    ,@SinkWarehouseName     = t.SinkWarehouseName
    ,@SinkWarehouseID       = t.SinkWarehouseID
    ,@SinkWarehouseSQLConnString = t.SinkWarehouseSQLConnString
    ,@StoredProcedureSchema = t.StoredProcedureSchema
    ,@StoredProcedureName   = t.StoredProcedureName
    ,@NotebookID            = t.NotebookID
    ,@SinkWorkspaceName     = t.SinkWorkspaceName
    ,@SinkWorkspaceID       = t.SinkWorkspaceID
    ,@IsWatermarkEnabledFlag = t.IsWatermarkEnabledFlag
    ,@HighWatermarkValue    = t.HighWatermarkValue
FROM gold.Task t
WHERE t.TaskKey = @TaskKey

SELECT
     @TaskKey               AS TaskKey
    ,@JobKey                AS JobKey
    ,@TaskName              AS TaskName
    ,@TaskType              AS TaskType
    ,@SinkWarehouseName     AS SinkWarehouseName
    ,@SinkWarehouseID       AS SinkWarehouseID
    ,@SinkWarehouseSQLConnString AS SinkWarehouseSQLConnString
    ,@StoredProcedureSchema AS StoredProcedureSchema
    ,@StoredProcedureName   AS StoredProcedureName
    ,@NotebookID            AS NotebookID
    ,@SinkWorkspaceName     AS SinkWorkspaceName
    ,@SinkWorkspaceID       AS SinkWorkspaceID
    ,@IsWatermarkEnabledFlag AS IsWatermarkEnabledFlag
    ,@HighWatermarkValue    AS HighWatermarkValue

END

GO

