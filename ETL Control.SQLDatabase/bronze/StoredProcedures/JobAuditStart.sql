
CREATE   PROCEDURE [bronze].[JobAuditStart]
    @JobName            VARCHAR(200) = NULL,   -- optional
    @WorkspaceID  VARCHAR(200),
    @PipelineRunID      VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Normalise empty string to NULL so storage is clean
    SET @JobName = NULLIF(LTRIM(RTRIM(@JobName)), '');

    DECLARE @JobKey     INT = NULL;
    DECLARE @IsAdHocJob BIT = 1;

    IF @JobName IS NOT NULL
    BEGIN
        SELECT
            @JobKey     = JobKey,
            @IsAdHocJob = 0
        FROM [bronze].[Job]
        WHERE LOWER(JobName) = LOWER(@JobName);
        -- If no match found: @JobKey stays NULL, @IsAdHocJob stays 1
        -- (unknown JobName passed — still treated as ad-hoc)
    END
    -- If @JobName IS NULL: skip lookup entirely, stays ad-hoc

    -- Restart detection
    DECLARE @ExistingKey BIGINT = NULL;

    SELECT @ExistingKey = JobAuditKey
    FROM   [bronze].[JobAudit]
    WHERE  PipelineRunID = @PipelineRunID
      AND  [Status]      = 'Running';

    IF @ExistingKey IS NOT NULL
    BEGIN
        UPDATE [bronze].[JobAudit]
        SET    [RestartTime] = SYSUTCDATETIME(),
               [Status]      = 'Running',
               [LastUpdated] = SYSUTCDATETIME()
        WHERE  [JobAuditKey] = @ExistingKey;

        SELECT @ExistingKey AS JobAuditKey;
    END
    ELSE
    BEGIN
        INSERT INTO [bronze].[JobAudit]
            ([JobKey], [JobName], [IsAdHocJob], [StartTime],
             [Status], [WorkspaceID], [PipelineRunID], [LastUpdated])
        VALUES
            (@JobKey, @JobName, @IsAdHocJob, SYSUTCDATETIME(),
             'Running', @WorkspaceID, @PipelineRunID, SYSUTCDATETIME());

        SELECT SCOPE_IDENTITY() AS JobAuditKey;
    END
END;

GO

