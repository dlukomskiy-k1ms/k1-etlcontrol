# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "776c8665-f2b2-4049-8150-af4090941340",
# META       "default_lakehouse_name": "lh_TestIngestion",
# META       "default_lakehouse_workspace_id": "58d5660e-b470-43bb-9b03-52ccccb99ce6",
# META       "known_lakehouses": [
# META         {
# META           "id": "776c8665-f2b2-4049-8150-af4090941340"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

table_name = "TestSaveDF.TestSaveTable2"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

BronzeSchemaName = "TestSaveDF"
BronzeTableName = "TestSaveTable2"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

table_name2 = "Products"

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

df = spark.sql("select 1 AS COL1, 'Test' AS COL2")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

BronzeWorkspaceName = "K1MS - [1 Dev] 01 ETL Control"
BronzeWorkspaceId = "58d5660e-b470-43bb-9b03-52ccccb99ce6"
BronzeLakehouseName = "lh_TestIngestion"
BronzeLakehouseId = "776c8665-f2b2-4049-8150-af4090941340"

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

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

    print("Table doesn't exist yet. Saving as new table.")
    if BronzeSchemaName:
        spark.sql(f"CREATE SCHEMA IF NOT EXISTS {BronzeSchemaName}")
        df.write.format("delta").mode("overwrite").save(f"{bronze_lh_basepath}/Tables/{BronzeSchemaName}/{BronzeTableName}/")
        print("Table saved!")
    else:
        df.write.format("delta").mode("overwrite").save(f"{bronze_lh_basepath}/Tables/{BronzeTableName}/")
        print("Table saved! No schema.")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.catalog.refreshTable("Locations")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

audit_stats = get_delta_audit_stats(table_name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

print(table_name)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

print(audit_stats)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC CREATE SCHEMA IF NOT EXISTS dbo

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

tables = spark.catalog.listTables()
print(tables)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

for table in tables:
    spark.sql(f"DROP TABLE IF EXISTS `{table.name}`")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
