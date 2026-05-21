
-- ============================================================
-- PROC: silver.TaskAuditStart
-- Called at the start of each task pipeline (DatabaseTask,
-- FileTask, ApiTask). Returns the new TaskAuditKey.
-- Handles restarts: if a Running row already exists for the
-- same PipelineRunID + TaskKey it updates RestartTime
-- (carried via DebugString) instead of inserting a new row.
-- ============================================================
CREATE   PROCEDURE [silver].[TaskAuditStart]
    @JobAuditKey    BIGINT,
    @TaskKey        INT,
    @TaskType       VARCHAR(100),
    @PipelineRunID  VARCHAR(100),
    @TaskVariables  VARCHAR(4000) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExistingKey BIGINT = NULL;

    SELECT @ExistingKey = TaskAuditKey
    FROM   [silver].[TaskAudit]
    WHERE  PipelineRunID = @PipelineRunID
      AND  TaskKey       = @TaskKey
      AND  IsRunning     = 1;

    IF @ExistingKey IS NOT NULL
    BEGIN
        -- Restart of an existing running task
        UPDATE [silver].[TaskAudit]
        SET    [DebugString]   = CONCAT(ISNULL([DebugString], ''), ' | RESTARTED: ', CONVERT(VARCHAR, SYSUTCDATETIME(), 126)),
               [TaskVariables] = ISNULL(@TaskVariables, [TaskVariables]),
               [LastUpdated]   = SYSUTCDATETIME()
        WHERE  [TaskAuditKey]  = @ExistingKey;

        SELECT @ExistingKey AS TaskAuditKey;
    END
    ELSE
    BEGIN
        INSERT INTO [silver].[TaskAudit]
            ([JobAuditKey], [TaskKey], [TaskType], [Status], [IsRunning],
             [StartTime], [PipelineRunID], [TaskVariables], [LastUpdated])
        VALUES
            (@JobAuditKey, @TaskKey, @TaskType, 'Running', 1,
             SYSUTCDATETIME(), @PipelineRunID, @TaskVariables, SYSUTCDATETIME());

        SELECT SCOPE_IDENTITY() AS TaskAuditKey;
    END
END;

GO

