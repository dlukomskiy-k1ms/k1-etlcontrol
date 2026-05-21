-- ============================================================
-- PROC: silver.TaskAuditExecutionUpdate
-- Called after each task pipeline completes (success or fail), but BEFORE the TaskAuditEnd sproc.
-- Row-count fields are populated.
-- ============================================================
CREATE   PROCEDURE [silver].[TaskAuditExecutionUpdate]
    @TaskAuditKey   BIGINT,
    @RowsRead       BIGINT        = NULL,
    @RowsCopied     BIGINT        = NULL,
    @RowsSkipped    BIGINT        = NULL,
    @RowsInserted   BIGINT        = NULL,
    @RowsUpdated    BIGINT        = NULL,
    @RowsDeleted    BIGINT        = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [silver].[TaskAudit]
    SET    [RowsRead]      = ISNULL(@RowsRead,      [RowsRead]),
           [RowsCopied]    = ISNULL(@RowsCopied,    [RowsCopied]),
           [RowsSkipped]   = ISNULL(@RowsSkipped,   [RowsSkipped]),
           [RowsInserted]  = ISNULL(@RowsInserted,  [RowsInserted]),
           [RowsUpdated]   = ISNULL(@RowsUpdated,   [RowsUpdated]),
           [RowsDeleted]   = ISNULL(@RowsDeleted,   [RowsDeleted]),
           [LastUpdated]   = SYSUTCDATETIME()
    WHERE  [TaskAuditKey]  = @TaskAuditKey;
END;

GO

