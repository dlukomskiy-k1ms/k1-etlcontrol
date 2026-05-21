-- ============================================================
-- PROC: gold.JobAudit_End
-- Called after Run job succeeds or fails.
-- ============================================================
CREATE   PROCEDURE [gold].[JobAuditEnd]
    @JobAuditKey  BIGINT,
    @Status       VARCHAR(50)   -- 'Succeeded' | 'Failed'
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [gold].[JobAudit]
    SET    [EndTime]     = SYSUTCDATETIME(),
           [Status]      = @Status,
           [LastUpdated] = SYSUTCDATETIME()
    WHERE  [JobAuditKey] = @JobAuditKey;
END;

GO

