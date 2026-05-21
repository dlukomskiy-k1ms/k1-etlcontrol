
select * from bronze.Job;
insert into bronze.Job VALUES ('Ingest SBG VIP','Daily Ingestion of SBG VIP from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest CAFFEY Encompass','Daily Ingestion of CAFFEY Encompass from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest HDC VIP','Daily Ingestion of HDC VIP from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest KEG1O Encompass','Daily Ingestion of KEG1O Encompass from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest KEG1CO Encompass','Daily Ingestion of KEG1CO Encompass from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest KEG1RC VIP','Daily Ingestion of KEG1RC VIP from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest KEG1MO VIP','Daily Ingestion of KEG1MO VIP from SnowFlake',1);
insert into bronze.Job VALUES ('Ingest KEG1IA Encompass','Daily Ingestion of KEG1IA Encompass from SnowFlake',1);

select * from bronze.Notebook;
insert into bronze.Notebook VALUES ('nb_etlControl_Ingest_SnowFlakeDB','Ingest data from SnowFlakeDB using Spark','34dde9c7-77f9-4e26-8110-a9766af313b9');

select * from bronze.Locations;
insert into bronze.Locations (WorkspaceId,WorkspaceName,LakehouseId,LakehouseName)
VALUES ('58d5660e-b470-43bb-9b03-52ccccb99ce6','K1MS - [1 Dev] 01 ETL Control','776c8665-f2b2-4049-8150-af4090941340','lh_TestIngestion');

select * from bronze.Task;

--- SBG VIP TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'WAREHOUSE_PICKING_SHIFT_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','WAREHOUSE_PICKING_SHIFT_DIMENSION',
'WAREHOUSE_PICKING_SHIFT_CODE','UPDATE_TIMESTAMP','WHERE SHIFT_START_DATE >= ''2023-01-01''','filter',1,'dbo','WAREHOUSE_PICKING_SHIFT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'ACCOUNT_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','ACCOUNT_DIMENSION',
'ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ACCOUNT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','ITEM_DIMENSION',
'ITEM_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'WAREHOUSE_ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','WAREHOUSE_ITEM_DIMENSION',
'WAREHOUSE_ITEM_CODE,WAREHOUSE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'INVOICE_REASON_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','INVOICE_REASON_DIMENSION',
'INVOICE_REASON_CODE,SOURCE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','INVOICE_REASON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'SUPPLIER_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','SUPPLIER_DIMENSION',
'SUPPLIER_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SUPPLIER_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'SALES_PERSON_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','SALES_PERSON_DIMENSION',
'SALES_PERSON_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_PERSON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'SALES_SUPERVISOR_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','SALES_SUPERVISOR_DIMENSION',
'SALES_SUPERVISOR_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_SUPERVISOR_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'SALES_POINTER_ACCOUNT_RELATION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','SALES_POINTER_ACCOUNT_RELATION',
'SALES_POINTER_CODE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_POINTER_ACCOUNT_RELATION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'PICKING_EMPLOYEE_BREAK_MEASURE',1,'DatabaseTask',0,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','PICKING_EMPLOYEE_BREAK_MEASURE',
'WAREHOUSE_CODE,PICKING_EMPLOYEE_CODE,EMPLOYEE_BREAK_DATE,EMPLOYEE_PICKING_BREAK_TYPE_CODE,SOURCE_CODE','UPDATE_TIMESTAMP','WHERE EMPLOYEE_BREAK_DATE >= ''2023-01-01''','filter',1,'dbo','PICKING_EMPLOYEE_BREAK_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'PALLET_PICKING_ACTIVITY_MEASURE',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','PALLET_PICKING_ACTIVITY_MEASURE',
'PICKER_EMPLOYEE_CODE,PALLET_PICKING_DATE,WAREHOUSE_PICKING_SHIFT_CODE,PALLET_LICENSE_PLATE_CODE,TRUCK_LOAD_CODE','UPDATE_TIMESTAMP','WHERE PALLET_PICKING_DATE >= ''2023-01-01''','filter',1,'dbo','PALLET_PICKING_ACTIVITY_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'ORDER_MEASURE',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','ORDER_MEASURE',
'ORDER_CODE,ORDER_LINE_NUMBER,ORDER_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE ORDER_DATE >= ''2023-01-01''','filter',1,'dbo','ORDER_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'INVENTORY_ON_HAND_MEASURE',1,'DatabaseTask',0,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','INVENTORY_ON_HAND_MEASURE',
'INVN_AS_OF_DATE,WAREHOUSE_CODE,ITEM_CODE,CODE_DATE,WAREHOUSE_SLOT_CODE,INVENTORY_TRANS_TYPE_CODE,INVN_VIP_UNIT_ID,INVN_LINE_NUMBER','UPDATE_TIMESTAMP','INVN_AS_OF_DATE >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','INVENTORY_ON_HAND_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'INVOICE_MEASURE',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','INVOICE_MEASURE',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE INVOICE_DATE >= ''2023-01-01''','filter',1,'dbo','INVOICE_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (1,'WAREHOUSE_DIMENSION',1,'DatabaseTask',1,NULL,'SBG','SBGVIP','snowflake',1,'VIPSHARE_KEG1SBG','C_10007233_DGB53269','WAREHOUSE_DIMENSION',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_DIMENSION','merge','UPDATE_TIMESTAMP');


--- CAFFEY Encompass TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Products',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Products',
'ProductID','TimeUpdated',NULL,'incremental',1,'dbo','Products','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'AssignedUsers',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','AssignedUsers',
'AssignedUserID','TimeUpdated',NULL,'incremental',1,'dbo','AssignedUsers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Chains',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Chains',
'ChainID','TimeUpdated',NULL,'incremental',1,'dbo','Chains','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Suppliers',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Suppliers',
'SupplierID','TimeUpdated',NULL,'incremental',1,'dbo','Suppliers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Brands',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Brands',
'BrandID','TimeUpdated',NULL,'incremental',1,'dbo','Brands','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Packages',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Packages',
'PackageID','TimeUpdated',NULL,'incremental',1,'dbo','Packages','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Customers',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Customers',
'CustomerID','TimeUpdated',NULL,'incremental',1,'dbo','Customers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'CustomerTypes',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','CustomerTypes',
'CustomerTypeID','TimeUpdated',NULL,'incremental',1,'dbo','CustomerTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Locations',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Locations',
'LocationID','TimeUpdated',NULL,'incremental',1,'dbo','Locations','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'Territories',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','Territories',
'TerritoryID','TimeUpdated',NULL,'incremental',1,'dbo','Territories','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'ProductTypes',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','ProductTypes',
'ProductTypeID','TimeUpdated',NULL,'incremental',1,'dbo','ProductTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'InventoryDaily',1,'DatabaseTask',0,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','InventoryDaily',
'InventoryDailyID','TimeUpdated','"Date" >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','InventoryDaily','reload','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (2,'InvoiceTransReport',1,'DatabaseTask',1,NULL,'CAFFEY','CAFFEYEncompass','snowflake',1,'TOTALK1MS','PUBLIC','InvoiceTransReport',
'InvoiceTransID','TimeUpdated','"LoadSheetDate" >= ''2023-01-01''','filter',1,'dbo','InvoiceTransReport','merge','TimeUpdated');


--- HDC VIP TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'WAREHOUSE_PICKING_SHIFT_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','WAREHOUSE_PICKING_SHIFT_DIMENSION',
'WAREHOUSE_PICKING_SHIFT_CODE','UPDATE_TIMESTAMP','WHERE SHIFT_START_DATE >= ''2023-01-01''','filter',1,'dbo','WAREHOUSE_PICKING_SHIFT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'ACCOUNT_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','ACCOUNT_DIMENSION',
'ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ACCOUNT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','ITEM_DIMENSION',
'ITEM_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'WAREHOUSE_ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','WAREHOUSE_ITEM_DIMENSION',
'WAREHOUSE_ITEM_CODE,WAREHOUSE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'INVOICE_REASON_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','INVOICE_REASON_DIMENSION',
'INVOICE_REASON_CODE,SOURCE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','INVOICE_REASON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'SUPPLIER_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','SUPPLIER_DIMENSION',
'SUPPLIER_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SUPPLIER_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'SALES_PERSON_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','SALES_PERSON_DIMENSION',
'SALES_PERSON_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_PERSON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'SALES_SUPERVISOR_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','SALES_SUPERVISOR_DIMENSION',
'SALES_SUPERVISOR_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_SUPERVISOR_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'SALES_POINTER_ACCOUNT_RELATION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','SALES_POINTER_ACCOUNT_RELATION',
'SALES_POINTER_CODE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_POINTER_ACCOUNT_RELATION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'PICKING_EMPLOYEE_BREAK_MEASURE',1,'DatabaseTask',0,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','PICKING_EMPLOYEE_BREAK_MEASURE',
'WAREHOUSE_CODE,PICKING_EMPLOYEE_CODE,EMPLOYEE_BREAK_DATE,EMPLOYEE_PICKING_BREAK_TYPE_CODE,SOURCE_CODE','UPDATE_TIMESTAMP','WHERE EMPLOYEE_BREAK_DATE >= ''2023-01-01''','filter',1,'dbo','PICKING_EMPLOYEE_BREAK_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'PALLET_PICKING_ACTIVITY_MEASURE',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','PALLET_PICKING_ACTIVITY_MEASURE',
'PICKER_EMPLOYEE_CODE,PALLET_PICKING_DATE,WAREHOUSE_PICKING_SHIFT_CODE,PALLET_LICENSE_PLATE_CODE,TRUCK_LOAD_CODE','UPDATE_TIMESTAMP','WHERE PALLET_PICKING_DATE >= ''2023-01-01''','filter',1,'dbo','PALLET_PICKING_ACTIVITY_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'ORDER_MEASURE',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','ORDER_MEASURE',
'ORDER_CODE,ORDER_LINE_NUMBER,ORDER_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE ORDER_DATE >= ''2023-01-01''','filter',1,'dbo','ORDER_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'INVENTORY_ON_HAND_MEASURE',1,'DatabaseTask',0,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','INVENTORY_ON_HAND_MEASURE',
'INVN_AS_OF_DATE,WAREHOUSE_CODE,ITEM_CODE,CODE_DATE,WAREHOUSE_SLOT_CODE,INVENTORY_TRANS_TYPE_CODE,INVN_VIP_UNIT_ID,INVN_LINE_NUMBER','UPDATE_TIMESTAMP','INVN_AS_OF_DATE >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','INVENTORY_ON_HAND_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'INVOICE_MEASURE',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','INVOICE_MEASURE',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE INVOICE_DATE >= ''2023-01-01''','filter',1,'dbo','INVOICE_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (3,'WAREHOUSE_DIMENSION',1,'DatabaseTask',1,NULL,'HDC','HDCVIP','snowflake',1,'VIPSHARE_KEG1HDC','C_10012505_DGB53269','WAREHOUSE_DIMENSION',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_DIMENSION','merge','UPDATE_TIMESTAMP');


--- KEG1O Encompass TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Products',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Products',
'ProductID','TimeUpdated',NULL,'incremental',1,'dbo','Products','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'AssignedUsers',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','AssignedUsers',
'AssignedUserID','TimeUpdated',NULL,'incremental',1,'dbo','AssignedUsers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Chains',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Chains',
'ChainID','TimeUpdated',NULL,'incremental',1,'dbo','Chains','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'TradeChannels',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','TradeChannels',
'TradeChannelID','TimeUpdated',NULL,'incremental',1,'dbo','TradeChannels','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Suppliers',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Suppliers',
'SupplierID','TimeUpdated',NULL,'incremental',1,'dbo','Suppliers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Brands',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Brands',
'BrandID','TimeUpdated',NULL,'incremental',1,'dbo','Brands','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Packages',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Packages',
'PackageID','TimeUpdated',NULL,'incremental',1,'dbo','Packages','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Customers',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Customers',
'CustomerID','TimeUpdated',NULL,'incremental',1,'dbo','Customers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'CustomerTypes',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','CustomerTypes',
'CustomerTypeID','TimeUpdated',NULL,'incremental',1,'dbo','CustomerTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Locations',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Locations',
'LocationID','TimeUpdated',NULL,'incremental',1,'dbo','Locations','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'Territories',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','Territories',
'TerritoryID','TimeUpdated',NULL,'incremental',1,'dbo','Territories','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'ProductTypes',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','ProductTypes',
'ProductTypeID','TimeUpdated',NULL,'incremental',1,'dbo','ProductTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'InventoryDaily',1,'DatabaseTask',0,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','InventoryDaily',
'InventoryDailyID','TimeUpdated','"Date" >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','InventoryDaily','reload','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (4,'InvoiceTransReport',1,'DatabaseTask',1,NULL,'KEG1O','KEG1OEncompass','snowflake',1,'ONEALKEG1DATA','PUBLIC','InvoiceTransReport',
'InvoiceTransID','TimeUpdated','"LoadSheetDate" >= ''2023-01-01''','filter',1,'dbo','InvoiceTransReport','merge','TimeUpdated');


--- KEG1CO Encompass TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Products',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Products',
'ProductID','TimeUpdated',NULL,'incremental',1,'dbo','Products','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'AssignedUsers',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','AssignedUsers',
'AssignedUserID','TimeUpdated',NULL,'incremental',1,'dbo','AssignedUsers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Chains',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Chains',
'ChainID','TimeUpdated',NULL,'incremental',1,'dbo','Chains','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'TradeChannels',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','TradeChannels',
'TradeChannelID','TimeUpdated',NULL,'incremental',1,'dbo','TradeChannels','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Suppliers',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Suppliers',
'SupplierID','TimeUpdated',NULL,'incremental',1,'dbo','Suppliers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Brands',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Brands',
'BrandID','TimeUpdated',NULL,'incremental',1,'dbo','Brands','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Packages',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Packages',
'PackageID','TimeUpdated',NULL,'incremental',1,'dbo','Packages','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Customers',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Customers',
'CustomerID','TimeUpdated',NULL,'incremental',1,'dbo','Customers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'CustomerTypes',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','CustomerTypes',
'CustomerTypeID','TimeUpdated',NULL,'incremental',1,'dbo','CustomerTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Locations',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Locations',
'LocationID','TimeUpdated',NULL,'incremental',1,'dbo','Locations','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'Territories',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','Territories',
'TerritoryID','TimeUpdated',NULL,'incremental',1,'dbo','Territories','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'ProductTypes',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','ProductTypes',
'ProductTypeID','TimeUpdated',NULL,'incremental',1,'dbo','ProductTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'InventoryDaily',1,'DatabaseTask',0,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','InventoryDaily',
'InventoryDailyID','TimeUpdated','"Date" >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','InventoryDaily','reload','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (5,'InvoiceTransReport',1,'DatabaseTask',1,NULL,'KEG1CO','KEG1COEncompass','snowflake',1,'RMCDATA','PUBLIC','InvoiceTransReport',
'InvoiceTransID','TimeUpdated','"LoadSheetDate" >= ''2023-01-01''','filter',1,'dbo','InvoiceTransReport','merge','TimeUpdated');


--- KEG1RC VIP TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'WAREHOUSE_PICKING_SHIFT_DIMENSION',0,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_PICKING_SHIFT_DIMENSION',
'WAREHOUSE_PICKING_SHIFT_CODE','UPDATE_TIMESTAMP','WHERE SHIFT_START_DATE >= ''2023-01-01''','filter',1,'dbo','WAREHOUSE_PICKING_SHIFT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'ACCOUNT_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','ACCOUNT_DIMENSION',
'ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ACCOUNT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','ITEM_DIMENSION',
'ITEM_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'WAREHOUSE_ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_ITEM_DIMENSION',
'WAREHOUSE_ITEM_CODE,WAREHOUSE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'INVOICE_REASON_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','INVOICE_REASON_DIMENSION',
'INVOICE_REASON_CODE,SOURCE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','INVOICE_REASON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'SUPPLIER_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','SUPPLIER_DIMENSION',
'SUPPLIER_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SUPPLIER_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'SALES_PERSON_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','SALES_PERSON_DIMENSION',
'SALES_PERSON_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_PERSON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'SALES_SUPERVISOR_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','SALES_SUPERVISOR_DIMENSION',
'SALES_SUPERVISOR_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_SUPERVISOR_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'SALES_POINTER_ACCOUNT_RELATION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','SALES_POINTER_ACCOUNT_RELATION',
'SALES_POINTER_CODE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_POINTER_ACCOUNT_RELATION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'PICKING_EMPLOYEE_BREAK_MEASURE',0,'DatabaseTask',0,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','PICKING_EMPLOYEE_BREAK_MEASURE',
'WAREHOUSE_CODE,PICKING_EMPLOYEE_CODE,EMPLOYEE_BREAK_DATE,EMPLOYEE_PICKING_BREAK_TYPE_CODE,SOURCE_CODE','UPDATE_TIMESTAMP','WHERE EMPLOYEE_BREAK_DATE >= ''2023-01-01''','filter',1,'dbo','PICKING_EMPLOYEE_BREAK_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'PALLET_PICKING_ACTIVITY_MEASURE',0,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','PALLET_PICKING_ACTIVITY_MEASURE',
'PICKER_EMPLOYEE_CODE,PALLET_PICKING_DATE,WAREHOUSE_PICKING_SHIFT_CODE,PALLET_LICENSE_PLATE_CODE,TRUCK_LOAD_CODE','UPDATE_TIMESTAMP','WHERE PALLET_PICKING_DATE >= ''2023-01-01''','filter',1,'dbo','PALLET_PICKING_ACTIVITY_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'ORDER_MEASURE',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','ORDER_MEASURE',
'ORDER_CODE,ORDER_LINE_NUMBER,ORDER_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE ORDER_DATE >= ''2023-01-01''','filter',1,'dbo','ORDER_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'INVENTORY_ON_HAND_MEASURE',1,'DatabaseTask',0,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','INVENTORY_ON_HAND_MEASURE',
'INVN_AS_OF_DATE,WAREHOUSE_CODE,ITEM_CODE,CODE_DATE,WAREHOUSE_SLOT_CODE,INVENTORY_TRANS_TYPE_CODE,INVN_VIP_UNIT_ID,INVN_LINE_NUMBER','UPDATE_TIMESTAMP','INVN_AS_OF_DATE >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','INVENTORY_ON_HAND_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'INVOICE_MEASURE',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','INVOICE_MEASURE',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE INVOICE_DATE >= ''2023-01-01''','filter',1,'dbo','INVOICE_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (6,'WAREHOUSE_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1RC','KEG1RCVIP','snowflake',1,'VIPMIRROR_KEG1RC_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_DIMENSION',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_DIMENSION','merge','UPDATE_TIMESTAMP');


--- KEG1MO VIP TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'WAREHOUSE_PICKING_SHIFT_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_PICKING_SHIFT_DIMENSION',
'WAREHOUSE_PICKING_SHIFT_CODE','UPDATE_TIMESTAMP','WHERE SHIFT_START_DATE >= ''2023-01-01''','filter',1,'dbo','WAREHOUSE_PICKING_SHIFT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'ACCOUNT_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','ACCOUNT_DIMENSION',
'ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ACCOUNT_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','ITEM_DIMENSION',
'ITEM_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'WAREHOUSE_ITEM_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_ITEM_DIMENSION',
'WAREHOUSE_ITEM_CODE,WAREHOUSE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_ITEM_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'INVOICE_REASON_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','INVOICE_REASON_DIMENSION',
'INVOICE_REASON_CODE,SOURCE_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','INVOICE_REASON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'SUPPLIER_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','SUPPLIER_DIMENSION',
'SUPPLIER_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SUPPLIER_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'SALES_PERSON_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','SALES_PERSON_DIMENSION',
'SALES_PERSON_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_PERSON_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'SALES_SUPERVISOR_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','SALES_SUPERVISOR_DIMENSION',
'SALES_SUPERVISOR_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_SUPERVISOR_DIMENSION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'SALES_POINTER_ACCOUNT_RELATION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','SALES_POINTER_ACCOUNT_RELATION',
'SALES_POINTER_CODE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','SALES_POINTER_ACCOUNT_RELATION','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'PICKING_EMPLOYEE_BREAK_MEASURE',1,'DatabaseTask',0,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','PICKING_EMPLOYEE_BREAK_MEASURE',
'WAREHOUSE_CODE,PICKING_EMPLOYEE_CODE,EMPLOYEE_BREAK_DATE,EMPLOYEE_PICKING_BREAK_TYPE_CODE,SOURCE_CODE','UPDATE_TIMESTAMP','WHERE EMPLOYEE_BREAK_DATE >= ''2023-01-01''','filter',1,'dbo','PICKING_EMPLOYEE_BREAK_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'PALLET_PICKING_ACTIVITY_MEASURE',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','PALLET_PICKING_ACTIVITY_MEASURE',
'PICKER_EMPLOYEE_CODE,PALLET_PICKING_DATE,WAREHOUSE_PICKING_SHIFT_CODE,PALLET_LICENSE_PLATE_CODE,TRUCK_LOAD_CODE','UPDATE_TIMESTAMP','WHERE PALLET_PICKING_DATE >= ''2023-01-01''','filter',1,'dbo','PALLET_PICKING_ACTIVITY_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'ORDER_MEASURE',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','ORDER_MEASURE',
'ORDER_CODE,ORDER_LINE_NUMBER,ORDER_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE ORDER_DATE >= ''2023-01-01''','filter',1,'dbo','ORDER_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'INVENTORY_ON_HAND_MEASURE',1,'DatabaseTask',0,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','INVENTORY_ON_HAND_MEASURE',
'INVN_AS_OF_DATE,WAREHOUSE_CODE,ITEM_CODE,CODE_DATE,WAREHOUSE_SLOT_CODE,INVENTORY_TRANS_TYPE_CODE,INVN_VIP_UNIT_ID,INVN_LINE_NUMBER','UPDATE_TIMESTAMP','INVN_AS_OF_DATE >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','INVENTORY_ON_HAND_MEASURE','reload','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'INVOICE_MEASURE',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','INVOICE_MEASURE',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP','WHERE INVOICE_DATE >= ''2023-01-01''','filter',1,'dbo','INVOICE_MEASURE','merge','UPDATE_TIMESTAMP');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (7,'WAREHOUSE_DIMENSION',1,'DatabaseTask',1,NULL,'KEG1MO','KEG1MOVIP','snowflake',1,'VIPMIRROR_KEG1MO_ONLY','FILTERED_VIP_VIEWS','WAREHOUSE_DIMENSION',
'INVOICE_CODE,INVOICE_LINE_NUMBER,ITEM_CODE,INVOICE_DATE,ACCOUNT_CODE','UPDATE_TIMESTAMP',NULL,'incremental',1,'dbo','WAREHOUSE_DIMENSION','merge','UPDATE_TIMESTAMP');

--- KEG1IA Encompass TASKS
insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Products',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Products',
'ProductID','TimeUpdated',NULL,'incremental',1,'dbo','Products','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'AssignedUsers',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','AssignedUsers',
'AssignedUserID','TimeUpdated',NULL,'incremental',1,'dbo','AssignedUsers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Chains',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Chains',
'ChainID','TimeUpdated',NULL,'incremental',1,'dbo','Chains','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'TradeChannels',0,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','TradeChannels',
'TradeChannelID','TimeUpdated',NULL,'incremental',1,'dbo','TradeChannels','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Suppliers',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Suppliers',
'SupplierID','TimeUpdated',NULL,'incremental',1,'dbo','Suppliers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Brands',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Brands',
'BrandID','TimeUpdated',NULL,'incremental',1,'dbo','Brands','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Packages',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Packages',
'PackageID','TimeUpdated',NULL,'incremental',1,'dbo','Packages','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Customers',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Customers',
'CustomerID','TimeUpdated',NULL,'incremental',1,'dbo','Customers','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'CustomerTypes',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','CustomerTypes',
'CustomerTypeID','TimeUpdated',NULL,'incremental',1,'dbo','CustomerTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Locations',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Locations',
'LocationID','TimeUpdated',NULL,'incremental',1,'dbo','Locations','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'Territories',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','Territories',
'TerritoryID','TimeUpdated',NULL,'incremental',1,'dbo','Territories','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'ProductTypes',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','ProductTypes',
'ProductTypeID','TimeUpdated',NULL,'incremental',1,'dbo','ProductTypes','merge','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'InventoryDaily',1,'DatabaseTask',0,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','InventoryDaily',
'InventoryDailyID','TimeUpdated','"Date" >= DATEADD(DAY, -90, CURRENT_DATE)','filter',1,'dbo','InventoryDaily','reload','TimeUpdated');

insert into bronze.Task (JobKey,TaskName,IsActiveFlag,TaskType,IsWatermarkEnabledFlag,SourceLocationKey,
ParentSourceName,SourceName,SourceType,NotebookKey,SourceDatabaseName,SourceSchemaName,SourceTableName,
PrimaryKeyColumnList,SortByColumnList,SourceWhereClause,SourceExtractionMethod,SinkLocationKey,SinkSchemaName,SinkTableName,SinkLoadMethod,SinkWatermarkColumn)
VALUES (8,'InvoiceTransReport',1,'DatabaseTask',1,NULL,'KEG1IA','KEG1IAEncompass','snowflake',1,'KEG1IADATA','PUBLIC','InvoiceTransReport',
'InvoiceTransID','TimeUpdated','"LoadSheetDate" >= ''2023-01-01''','filter',1,'dbo','InvoiceTransReport','merge','TimeUpdated');
