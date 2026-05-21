-- ============================================================
-- PROC: silver.JobAudit_End
-- Called after Run job succeeds or fails.
-- ============================================================
CREATE   PROCEDURE [silver].[JobAuditEnd]
    @JobAuditKey  BIGINT,
    @Status       VARCHAR(50)   -- 'Succeeded' | 'Failed'
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [silver].[JobAudit]
    SET    [EndTime]     = SYSUTCDATETIME(),
           [Status]      = @Status,
           [LastUpdated] = SYSUTCDATETIME()
    WHERE  [JobAuditKey] = @JobAuditKey;
END;

GO

