CREATE TABLE [silver].[TaskAudit] (
    [TaskAuditKey]  BIGINT         IDENTITY (1, 1) NOT NULL,
    [JobAuditKey]   BIGINT         NULL,
    [TaskKey]       INT            NULL,
    [TaskType]      VARCHAR (100)  NULL,
    [Status]        VARCHAR (400)  NULL,
    [IsRunning]     BIT            DEFAULT ((1)) NOT NULL,
    [StartTime]     DATETIME2 (6)  NULL,
    [EndTime]       DATETIME2 (6)  NULL,
    [RowsRead]      BIGINT         NULL,
    [RowsCopied]    BIGINT         NULL,
    [RowsSkipped]   BIGINT         NULL,
    [RowsInserted]  BIGINT         NULL,
    [RowsUpdated]   BIGINT         NULL,
    [RowsDeleted]   BIGINT         NULL,
    [TaskVariables] VARCHAR (4000) NULL,
    [DebugString]   VARCHAR (4000) NULL,
    [PipelineRunID] VARCHAR (100)  NULL,
    [LastUpdated]   DATETIME2 (6)  NULL,
    CONSTRAINT [PK_TaskAudit] PRIMARY KEY CLUSTERED ([TaskAuditKey] ASC),
    CONSTRAINT [FK_TaskAudit_JobAudit] FOREIGN KEY ([JobAuditKey]) REFERENCES [silver].[JobAudit] ([JobAuditKey])
);


GO

