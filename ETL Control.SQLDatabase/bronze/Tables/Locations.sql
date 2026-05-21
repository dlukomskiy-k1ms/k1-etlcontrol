CREATE TABLE [bronze].[Locations] (
    [LocationKey]        INT            IDENTITY (1, 1) NOT NULL,
    [FabricConnectionId] VARCHAR (1000) NULL,
    [WorkspaceId]        VARCHAR (1000) NULL,
    [WorkspaceName]      VARCHAR (1000) NULL,
    [LakehouseId]        VARCHAR (1000) NULL,
    [LakehouseName]      VARCHAR (1000) NULL,
    [WarehouseId]        VARCHAR (1000) NULL,
    [WarehouseName]      VARCHAR (1000) NULL,
    [WarehouseSQLString] VARCHAR (1000) NULL,
    [APIURL]             VARCHAR (1000) NULL
);


GO

