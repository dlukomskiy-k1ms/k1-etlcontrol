# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse_name": "",
# META       "default_lakehouse_workspace_id": ""
# META     },
# META     "warehouse": {}
# META   }
# META }

# CELL ********************

import pyodbc
import pandas as pd
import struct
import notebookutils

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

token = mssparkutils.credentials.getToken('https://database.windows.net').encode("UTF-16-LE")
token_struct = struct.pack(f'<I{len(token)}s', len(token), token)
SQL_COPT_SS_ACCESS_TOKEN = 1256

conn_str = ""

conn = pyodbc.connect(conn_str, attrs_before={SQL_COPT_SS_ACCESS_TOKEN: token_struct})
cursor = conn.cursor()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

tasks_query = """
    SELECT TaskKey, SinkLakehouseName, SinkSchemaName, SinkTableName,
           SinkWatermarkColumn, IsWatermarkRowVersionType
    FROM etl.Task
    WHERE JobKey = 2 AND IsWatermarkEnabledFlag = 1
"""

# Use pandas.read_sql to get result
tasks_pdf = pd.read_sql(tasks_query, conn)

# --- 3. Convert Pandas DataFrame to Spark DataFrame ---
tasks_df = spark.createDataFrame(tasks_pdf)

# --- 4. Check the result ---
display(tasks_df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# --- 1. Convert Spark DF to Pandas for iteration ---
tasks_pdf = tasks_df.toPandas()

# --- 3. Loop through each task ---
for _, t in tasks_pdf.iterrows():
    full_table = f"{t.SinkLakehouseName}.{t.SinkSchemaName}.{t.SinkTableName}"
    column = t.SinkWatermarkColumn

    if t.IsWatermarkRowVersionType:
        # --- Rowversion: get MAX as hex string using Spark SQL ---
        watermark_query = f"""
            SELECT CONCAT('0x', HEX(MAX({column}))) AS HighWatermarkValue
            FROM {full_table}
        """
    else:
        # --- Datetime: get MAX as string using Spark SQL ---
        watermark_query = f"""
            SELECT CAST(MAX({column}) AS STRING) AS HighWatermarkValue
            FROM {full_table}
        """

    # Execute Spark SQL
    max_val = spark.sql(watermark_query).collect()[0]["HighWatermarkValue"]
    print(f"t: {full_table}; val:{max_val}")

    # --- 4. Insert into SQL Server Watermark table ---
    cursor.execute("""
        INSERT INTO etl.Watermark (TaskKey, HighWatermarkValue)
        VALUES (?, ?)
    """, t.TaskKey, max_val)

# Commit the transaction
conn.commit()
cursor.close()
conn.close()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
