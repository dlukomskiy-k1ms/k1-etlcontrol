CREATE TABLE [bronze].[Notebook] (
    [NotebookKey]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [NotebookName]        VARCHAR (100)  NOT NULL,
    [NotebookDescription] VARCHAR (4000) NULL,
    [NotebookId]          VARCHAR (1000) NULL
);


GO

