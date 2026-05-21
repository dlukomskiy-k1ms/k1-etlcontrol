CREATE TABLE [gold].[Task] (
    [TaskKey]                    INT           IDENTITY (1, 1) NOT NULL,
    [JobKey]                     INT           NOT NULL,
    [TaskName]                   VARCHAR (250) NOT NULL,
    [IsActiveFlag]               BIT           NOT NULL,
    [TaskType]                   VARCHAR (250) NOT NULL,
    [SinkWarehouseName]          VARCHAR (250) NULL,
    [SinkWarehouseID]            VARCHAR (250) NULL,
    [SinkWarehouseSQLConnString] VARCHAR (250) NULL,
    [StoredProcedureSchema]      VARCHAR (250) NULL,
    [StoredProcedureName]        VARCHAR (250) NULL,
    [NotebookID]                 VARCHAR (250) NULL,
    [SinkWorkspaceName]          VARCHAR (250) NOT NULL,
    [SinkWorkspaceID]            VARCHAR (250) NOT NULL,
    [IsWatermarkEnabledFlag]     BIT           NOT NULL,
    [HighWatermarkValue]         DATETIME2 (6) NULL
);


GO

