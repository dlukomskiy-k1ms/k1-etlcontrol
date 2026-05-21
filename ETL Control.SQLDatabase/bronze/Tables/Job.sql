CREATE TABLE [bronze].[Job] (
    [JobKey]         INT           IDENTITY (1, 1) NOT NULL,
    [JobName]        VARCHAR (500) NOT NULL,
    [JobDescription] VARCHAR (500) NULL,
    [IsActiveFlag]   BIT           NOT NULL
);


GO

