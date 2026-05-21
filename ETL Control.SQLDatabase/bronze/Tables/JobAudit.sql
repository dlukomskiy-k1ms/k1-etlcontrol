CREATE TABLE [bronze].[JobAudit] (
    [JobAuditKey]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [JobKey]        INT           NULL,
    [JobName]       VARCHAR (200) NULL,
    [IsAdHocJob]    BIT           DEFAULT ((0)) NOT NULL,
    [StartTime]     DATETIME2 (6) NULL,
    [RestartTime]   DATETIME2 (6) NULL,
    [EndTime]       DATETIME2 (6) NULL,
    [Status]        VARCHAR (50)  NULL,
    [WorkspaceID]   VARCHAR (200) NULL,
    [PipelineRunID] VARCHAR (100) NULL,
    [LastUpdated]   DATETIME2 (6) NULL,
    CONSTRAINT [PK_JobAudit] PRIMARY KEY CLUSTERED ([JobAuditKey] ASC)
);


GO

