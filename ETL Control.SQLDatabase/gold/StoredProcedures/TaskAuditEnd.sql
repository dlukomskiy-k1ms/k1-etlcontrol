-- ============================================================
-- PROC: gold.TaskAuditEnd
-- Called after each task pipeline completes (success or fail).
-- Row-count fields are optional — pass NULL if your task type
-- doesn't produce them.
-- ============================================================
CREATE    PROCEDURE [gold].[TaskAuditEnd]
    @TaskAuditKey   BIGINT,
    @Status         VARCHAR(400),   -- 'Succeeded' | 'Failed'
    @DebugString    VARCHAR(4000) = NULL
AS

BEGIN
    SET NOCOUNT ON;

    UPDATE [gold].[TaskAudit]
    SET    [Status]        = @Status,
           [IsRunning]     = 0,
           [DebugString]   = ISNULL(@DebugString, [DebugString]),
           [EndTime]       = SYSUTCDATETIME(),
           [LastUpdated]   = SYSUTCDATETIME()
    WHERE  [TaskAuditKey]  = @TaskAuditKey;
END;

GO

