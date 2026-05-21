# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "environment": {
# META       "environmentId": "28d9635c-1e0e-9f3c-4f99-9493c86c763f",
# META       "workspaceId": "00000000-0000-0000-0000-000000000000"
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%configure -f
# MAGIC {
# MAGIC     "defaultLakehouse": {  
# MAGIC         "name": { 
# MAGIC             "parameterName": "BronzeLakehouseName", 
# MAGIC             "defaultValue": "lh_SBG"
# MAGIC         },
# MAGIC         "id": { 
# MAGIC             "parameterName": "BronzeLakehouseId", 
# MAGIC             "defaultValue": "c5e9d794-da5f-487f-9a50-55da74cbc67a"
# MAGIC         },
# MAGIC         "workspaceId": { 
# MAGIC             "parameterName": "BronzeWorkspaceId", 
# MAGIC             "defaultValue": "35511d3e-0ac8-43a6-99e7-83c6071ddf70"
# MAGIC         },
# MAGIC         "workspaceName": { 
# MAGIC             "parameterName": "BronzeWorkspaceName", 
# MAGIC             "defaultValue": "K1MS - [1 Dev] Data Hub"
# MAGIC         },
# MAGIC     }
# MAGIC }
# MAGIC      

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": true,
# META   "editable": false
# META }

# CELL ********************

# MAGIC %%configure -f
# MAGIC {
# MAGIC     "defaultLakehouse": {  
# MAGIC         "name": { 
# MAGIC             "parameterName": "BronzeLakehouseName", 
# MAGIC             "defaultValue": "lh_TestIngestion"
# MAGIC         },
# MAGIC         "id": { 
# MAGIC             "parameterName": "BronzeLakehouseId", 
# MAGIC             "defaultValue": "776c8665-f2b2-4049-8150-af4090941340"
# MAGIC         },
# MAGIC         "workspaceId": { 
# MAGIC             "parameterName": "BronzeWorkspaceId", 
# MAGIC             "defaultValue": "58d5660e-b470-43bb-9b03-52ccccb99ce6"
# MAGIC         },
# MAGIC         "workspaceName": { 
# MAGIC             "parameterName": "BronzeWorkspaceName", 
# MAGIC             "defaultValue": "K1MS - [1 Dev] 01 ETL Control"
# MAGIC         },
# MAGIC     }
# MAGIC }
# MAGIC      

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# PARAMETERS CELL ********************

JobAuditKey = 0
TaskAuditKey = 0
etlLoadDateTime = "2026-05-19T12:43:11Z"
TaskKey = 1
SourceName = "SBGVIP"
SourceType = "snowflake"
IsWatermarkEnabledFlag = True
PrimaryKeyColumnList = "WAREHOUSE_PICKING_SHIFT_CODE"
SortByColumnList = "UPDATE_TIMESTAMP"
SourceDatabaseName = "VIPSHARE_KEG1SBG"
SourceSchemaName = "C_10007233_DGB53269"
SourceTableName = "WAREHOUSE_PICKING_SHIFT_DIMENSION"
BronzeWorkspaceName = "K1MS - [1 Dev] 01 ETL Control"
BronzeWorkspaceId = "58d5660e-b470-43bb-9b03-52ccccb99ce6"
BronzeLakehouseName = "lh_TestIngestion"
BronzeLakehouseId = "776c8665-f2b2-4049-8150-af4090941340"
BronzeSchemaName = "dbo"
BronzeTableName = "WAREHOUSE_PICKING_SHIFT_DIMENSION"
BronzeLoadMethod = "merge"
WatermarkColumn = "UPDATE_TIMESTAMP"
SourceQuery = "SELECT * FROM VIPSHARE_KEG1SBG.C_10007233_DGB53269.WAREHOUSE_PICKING_SHIFT_DIMENSION WHERE SHIFT_START_DATE >= '2023-01-01'"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# This cell is generated from runtime parameters. Learn more: https://go.microsoft.com/fwlink/?linkid=2161015
JobAuditKey = 32
TaskAuditKey = 199
etlLoadDateTime = "20260521T022047Z"
TaskKey = 87
SourceName = "KEG1MOVIP"
SourceType = "snowflake"
IsWatermarkEnabledFlag = True
PrimaryKeyColumnList = "WAREHOUSE_PICKING_SHIFT_CODE"
SortByColumnList = "UPDATE_TIMESTAMP"
SourceDatabaseName = "VIPMIRROR_KEG1MO_ONLY"
SourceSchemaName = "FILTERED_VIP_VIEWS"
SourceTableName = "WAREHOUSE_PICKING_SHIFT_DIMENSION"
BronzeWorkspaceName = "K1MS - [1 Dev] 01 ETL Control"
BronzeWorkspaceId = "58d5660e-b470-43bb-9b03-52ccccb99ce6"
BronzeLakehouseName = "lh_TestIngestion"
BronzeLakehouseId = "776c8665-f2b2-4049-8150-af4090941340"
BronzeSchemaName = "KEG1MOVIP"
BronzeTableName = "WAREHOUSE_PICKING_SHIFT_DIMENSION"
BronzeLoadMethod = "merge"
WatermarkColumn = "UPDATE_TIMESTAMP"
SourceQuery = "SELECT *  FROM VIPMIRROR_KEG1MO_ONLY.FILTERED_VIP_VIEWS.WAREHOUSE_PICKING_SHIFT_DIMENSION WHERE SHIFT_START_DATE >= '2023-01-01'"


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

%run nb_etlControl_Utils

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

bronze_lh_basepath = get_bronze_lh_basepath(
    workspace_name=BronzeWorkspaceName, 
    lakehouse_name=BronzeLakehouseName
)

if PrimaryKeyColumnList:
    PrimaryKeyColumnList = PrimaryKeyColumnList.replace(", ", ",").replace("[", "").replace("]", "").replace(" ", "")
    pk_list = PrimaryKeyColumnList.split(",")
else:
    pk_list = []

if SortByColumnList:
    SortByColumnList = SortByColumnList.replace(", ", ",").replace("[", "").replace("]", "").replace(" ", "")
    sbc_list = SortByColumnList.split(",")
else:
    sbc_list = []

bronze_load_method = BronzeLoadMethod.lower()
stage_table = f"stg_{BronzeTableName}"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import notebookutils
import time
import datetime
import json
from delta.tables import DeltaTable

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Key Vault URL and secret names. Secrets switched by SourceName.

KEY_VAULT_URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_url)")

if SourceName == "SBGVIP":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_sbg_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_sbg_password)")
elif SourceName == "CAFFEYEncompass":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_caffey_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_caffey_password)")
elif SourceName == "HDCVIP":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_hdc_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_hdc_password)")
elif SourceName == "KEG1OEncompass":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1o_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1o_password)")
elif SourceName == "KEG1COEncompass":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1co_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1co_password)")
elif SourceName == "KEG1RCVIP":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1rc_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1rc_password)")
elif SourceName == "KEG1MOVIP":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_vip_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1mo_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1mo_password)")
elif SourceName == "KEG1IAEncompass":
    URL = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_url)")
    Warehouse = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_encompass_warehouse)")
    UserName = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1ia_username)")
    Password = notebookutils.variableLibrary.get("$(/**/vl_snowflake_locations/keyvault_keg1ia_password)")
else:
    print("No Matching SourceName!")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

snowflake_options = {
    "sfUrl": mssparkutils.credentials.getSecret(KEY_VAULT_URL, URL),
    "sfWarehouse": mssparkutils.credentials.getSecret(KEY_VAULT_URL, Warehouse),
    "sfUser": mssparkutils.credentials.getSecret(KEY_VAULT_URL, UserName),
    "sfPassword": mssparkutils.credentials.getSecret(KEY_VAULT_URL, Password),
    "sfDatabase": f"{SourceDatabaseName}",
    "sfSchema": f"{SourceSchemaName}"
}

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

if SourceQuery:
    print("Loading with query.")
    df = spark.read \
    .format("snowflake") \
    .options(**snowflake_options) \
    .option("query",SourceQuery) \
    .load()

else:
    FQN = f"{SourceDatabaseName}.{SourceSchemaName}.{SourceTableName}"
    query = f"SELECT * FROM {FQN}"
    df = spark.read \
    .format("snowflake") \
    .options(**snowflake_options) \
    .option("query",query) \
    .load()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

if df.isEmpty():
    result = {
        "TaskKey": TaskKey,
        "Message": "No data to process!",
        "HasWatermarkUpdate": False,
        **get_zero_audit_stats()
    }
    notebookutils.notebook.exit(json.dumps(result))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

if IsWatermarkEnabledFlag:
    from pyspark.sql import functions as F

    NewHighWatermarkValue = df.agg(F.max(WatermarkColumn)).collect()[0][0]
    NewHighWatermarkValue = str(NewHighWatermarkValue) if NewHighWatermarkValue is not None else None
    print(f"New HighWatermarkValue: {NewHighWatermarkValue}")

    HasWatermarkUpdate = True

else:
    HasWatermarkUpdate = False
    NewHighWatermarkValue = None

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Clean column names & Add metadata columns (TaskKey, JobAuditKey, TaskAuditKey, etlLoadDateTime)

df = clean_column_names(df)
df = add_audit_columns(df)

#display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Load data into bronze
spark.conf.set("spark.sql.caseSensitive", "True")

if BronzeSchemaName:
    table_name = f"{BronzeSchemaName}.{BronzeTableName}"
else:
    table_name = BronzeTableName

print(f"Bronze Table Name: {table_name}")
print(f"Bronze Load Method: {bronze_load_method}")
print(f"SourceType: {SourceType}")
    
if spark.catalog.tableExists(table_name):
    print("Table exists.")
    if bronze_load_method == "reload":
            (
                df.write.format("delta")
                    .mode("overwrite")
                    .option("overwriteSchema", "true")
                    .saveAsTable(table_name)
            )
    elif bronze_load_method == "append":
            (
                df.write.format("delta")
                    .mode("append")
                    .option("mergeSchema", "true")
                    .saveAsTable(table_name)
            )
    elif bronze_load_method == "merge":
            df.createOrReplaceTempView(stage_table)
            spark.conf.set("spark.databricks.delta.schema.autoMerge.enabled", "true")
            join_list = " and ".join([f'stage.{f} = bronze.{f}' for f in pk_list])
            order_list = ", ".join(sbc_list)
            merge_query = f"""
            WITH stg AS (
                SELECT *
                    , ROW_NUMBER() OVER (
                        PARTITION BY {PrimaryKeyColumnList} 
                        ORDER BY {order_list} DESC
                    ) AS ROWNUM
            FROM {stage_table}
            )
            MERGE INTO {table_name} AS bronze
            USING (SELECT * FROM stg WHERE ROWNUM = 1) AS stage
            ON {join_list}
            WHEN MATCHED THEN UPDATE SET *
            WHEN NOT MATCHED THEN INSERT *
            """
            print(merge_query)
            spark.sql(merge_query)
    else:
        raise Exception("Unknown load method!")
else:
    import time
    print("Table doesn't exist yet. Saving as new table.")

    if BronzeSchemaName:
        print(f"Checking for existing Schema: {BronzeSchemaName}")
        spark.sql(f"CREATE SCHEMA IF NOT EXISTS {BronzeSchemaName}")

    df.write.format("delta").mode("overwrite").saveAsTable(table_name)
    print("Table saved!")
    time.sleep(20)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Get audit stats & exit notebook

spark.catalog.refreshTable(table_name)

audit_stats = get_delta_audit_stats(table_name)

result = {
    "TaskKey": TaskKey,
    "HasWatermarkUpdate": HasWatermarkUpdate,
    "NewHighWatermarkValue": NewHighWatermarkValue,
    **audit_stats
}

notebookutils.notebook.exit(json.dumps(result))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
