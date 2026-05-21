CREATE TABLE [bronze].[Task] (
    [TaskKey]                    INT            IDENTITY (1, 1) NOT NULL,
    [JobKey]                     INT            NOT NULL,
    [TaskName]                   VARCHAR (200)  NOT NULL,
    [IsActiveFlag]               BIT            NOT NULL,
    [TaskType]                   VARCHAR (20)   NOT NULL,
    [IsWatermarkEnabledFlag]     BIT            NOT NULL,
    [IsWatermarkRowVersionType]  BIT            NULL,
    [SourceLocationKey]          INT            NULL,
    [ParentSourceName]           VARCHAR (200)  NOT NULL,
    [SourceName]                 VARCHAR (200)  NOT NULL,
    [SourceType]                 VARCHAR (200)  NOT NULL,
    [NotebookKey]                INT            NULL,
    [SourceDatabaseName]         VARCHAR (200)  NULL,
    [SourceSchemaName]           VARCHAR (200)  NULL,
    [SourceTableName]            VARCHAR (200)  NULL,
    [PrimaryKeyColumnList]       VARCHAR (1000) NULL,
    [SortByColumnList]           VARCHAR (1000) NULL,
    [SourceWhereClause]          VARCHAR (2500) NULL,
    [SourceExtractionMethod]     VARCHAR (2500) NULL,
    [OverrideQuery]              VARCHAR (2500) NULL,
    [JsonArrayName]              VARCHAR (100)  NULL,
    [LoadRawToBronzeMethod]      VARCHAR (250)  NULL,
    [LoadRawToBronzeNotebookKey] INT            NULL,
    [RawStoragePath]             VARCHAR (2000) NULL,
    [RawStorageFileName]         VARCHAR (200)  NULL,
    [SinkLocationKey]            INT            NOT NULL,
    [SinkSchemaName]             VARCHAR (200)  NULL,
    [SinkTableName]              VARCHAR (200)  NULL,
    [SinkLoadMethod]             VARCHAR (20)   NOT NULL,
    [SinkWatermarkColumn]        VARCHAR (1000) NULL
);


GO

