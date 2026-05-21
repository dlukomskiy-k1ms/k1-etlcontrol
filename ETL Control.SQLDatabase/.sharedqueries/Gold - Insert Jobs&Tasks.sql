drop table gold.Task

select * from gold.Job;
select * from gold.Task;

insert into gold.Job VALUES ('Gold Layer Facts','Execute stored procs for gold layer fact tables',1);
insert into gold.Job VALUES ('Gold Layer Dims','Execute stored procs for gold layer dim tables',1);

insert into gold.Task VALUES (1,'fact_picking',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_picking',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_inventory_on_hand',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_inventory_on_hand',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_item_cost',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_item_cost',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_invoice',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_invoice',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_operating_budget',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_operating_budget',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_invoice_dollars',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_invoice_dollars',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)
insert into gold.Task VALUES (1,'fact_invoice_cases',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_fact_invoice_cases',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',1,NULL)

insert into gold.Task VALUES (2,'dim_account',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_dim_account',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',0,NULL)
insert into gold.Task VALUES (2,'dim_date',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_dim_date',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',0,NULL)
insert into gold.Task VALUES (2,'dim_item',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_dim_item',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',0,NULL)
insert into gold.Task VALUES (2,'dim_location',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_dim_location',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',0,NULL)
insert into gold.Task VALUES (2,'dim_sales_person',1,'WarehouseTask','K1msDataWarehouse','b628cee2-ac47-4bf1-bda5-4740921fa233','czyylvzmcldejanvn2ylr4qawu-hyovcnoibktehgphqpdaoho7oa.datawarehouse.fabric.microsoft.com','Gold','usp_load_dim_sales_person',NULL,'K1MS - [1 Dev] Data Hub','35511d3e-0ac8-43a6-99e7-83c6071ddf70',0,NULL)


