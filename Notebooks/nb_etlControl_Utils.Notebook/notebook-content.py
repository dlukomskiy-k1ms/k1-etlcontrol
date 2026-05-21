# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {}
# META }

# CELL ********************

from pyspark.sql import DataFrame
from pyspark.sql.functions import lit, to_timestamp

def add_audit_columns(df: DataFrame) -> DataFrame:
    return (
        df
        .withColumn("TaskKey", lit(TaskKey))
        .withColumn("JobAuditKey", lit(JobAuditKey))
        .withColumn("TaskAuditKey", lit(TaskAuditKey))
        .withColumn(
            "etlLoadDateTime",
            to_timestamp(lit(etlLoadDateTime), "yyyyMMdd'T'HHmmss'Z'")
        )
    )

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from delta.tables import DeltaTable
import json

def get_delta_audit_stats(table_name: str) -> dict:
    """
    Captures row-level statistics from the latest Delta operation.
    """
    metrics = (
        DeltaTable.forName(spark, table_name)
        .history(1)
        .collect()[0]["operationMetrics"]
    )

    def m(key):
        val = metrics.get(key)
        return int(val) if val is not None else 0

    return {
        "RowsRead":     m("numSourceRows"),
        "RowsCopied":   m("numOutputRows"),
        "RowsSkipped":  m("numTargetRowsMatchedAndNotUpdated"),
        "RowsInserted": m("numTargetRowsInserted"),
        "RowsUpdated":  m("numTargetRowsUpdated"),
        "RowsDeleted":  m("numTargetRowsDeleted"),
    }


def get_zero_audit_stats():
    return {
        "RowsRead": 0,
        "RowsCopied": 0,
        "RowsSkipped": 0,
        "RowsInserted": 0,
        "RowsUpdated": 0,
        "RowsDeleted": 0
    }

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Get workspace id from workspace name
import sempy.fabric as fabric

def get_workspace_id(workspace_name):
    try:
        workspaces = fabric.list_workspaces()
        return workspaces[workspaces['Name'] == workspace_name]['Id'].values[0]
    except:
        # raise Exception("Workspace does not exist")
        return str()

def get_lakehouse_id(workspace_name, lakehouse_name):
    try:
        workspace_id = get_workspace_id(workspace_name)
        items = fabric.list_items(workspace=workspace_id)
        notebook_id = items[(items["Type"] == "Lakehouse") & (items["Display Name"] == lakehouse_name)]["Id"].iloc[0]
        return notebook_id
    except Exception as e:
        # raise Exception("Lakehouse does not exist")
        return str()


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

spark.conf.set("spark.ms.autotune.enabled", "true")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

def get_bronze_lh_basepath(
    workspace_name: str, 
    lakehouse_name: str
) -> str:
    workspace_id = get_workspace_id(workspace_name=workspace_name)
    bronze_lh_id = notebookutils.lakehouse.get(lakehouse_name, workspace_id).id
    lh_basepath = f"abfss://{workspace_id}@onelake.dfs.fabric.microsoft.com/{bronze_lh_id}"
    return lh_basepath

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

def get_bronze_lh_tablepath(
    workspace_name: str,
    lakehouse_name: str,
    schema: str,
    table_name: str
) -> str:

    base_path = get_bronze_lh_basepath(
        workspace_name=workspace_name,
        lakehouse_name=lakehouse_name
    )

    if schema:
        return f"{base_path}/Tables/{schema}/{table_name}"
    else:
        return f"{base_path}/Tables/{table_name}"


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

def count_files_path(path):
    total = 0
    for item in notebookutils.fs.ls(path):
        if item.isDir:
            total += count_files(item.path)
        else:
            total += 1
    return total

def count_files_wildcard(path, pattern=None):
    import fnmatch
    files = notebookutils.fs.ls(path)
    
    if pattern:
        return sum(
            1 for f in files 
            if not f.isDir and fnmatch.fnmatch(f.name, pattern)
        )
    else:
        return sum(1 for f in files if not f.isDir)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

def clean_column_names(df):
    import re
    new_cols = []
    
    for c in df.columns:
        # Remove double quotes
        clean = c.replace('"', '')
        
        # Replace invalid characters with underscore
        clean = re.sub(r'[ ,;{}()\n\t=]', '_', clean)
        
        # Remove multiple underscores
        clean = re.sub('_+', '_', clean)
        
        # Remove leading/trailing underscores
        clean = clean.strip('_')

        # Force lowercase
        #clean = clean.lower()
        
        new_cols.append(clean)
    
    return df.toDF(*new_cols)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

def preprocess_csv_file(input_path, output_path, encoding="utf-16-le", verbose=True):
    # Read raw bytes so we handle any line ending (CRLF, LF, CR)
    with open(input_path, "rb") as f:
        raw = f.read()

    text = raw.decode("utf-16-le", errors="replace")

    if '","' not in text:
        print("No pre-processing available for this file. Only converting file to UTF-8.")
        with open(output_path, "w", encoding="utf-8") as f:
          f.write(text)
    else:
        # Temporarily protect our delimiter
        text = text.replace('","', "<<<DELIM>>>")

        # Fix new-lines
        text = text.replace("\r\n", "\n").replace("\r", "\n")
        raw_lines = text.split("\n")

        # Use header to know how many fields a complete row should have
        header_field_count = len(raw_lines[0].split("<<<DELIM>>>"))
        stitched = []
        buffer = ""

        for line in raw_lines:
            if buffer:
                buffer += " " + line 
            else:
                buffer = line

            if len(buffer.split("<<<DELIM>>>")) >= header_field_count:
                stitched.append(buffer)
                buffer = ""

        if buffer:
            stitched.append(buffer)

        text = "\n".join(stitched)

        # Any additional missed new-line byte characters replace with a space so its all one line.
        text = re.sub(r'[\u000B\u000C\u0085\u2028\u2029]', ' ', text)

        # Remove all , " and \ from file
        text = text.replace(",", "")
        text = text.replace('"', '')
        text = text.replace("\\", "")

        # Put back our delimiter as , only
        text = text.replace("<<<DELIM>>>", ",")

        # split into new lines
        lines = text.split("\n")
        clean_text = "\n".join(lines)

        with open(output_path, "w", encoding="utf-8") as f:
            f.write(clean_text)

        print(f"Preprocessing complete → {output_path}")
        print(f"   Original size : {len(raw):,} bytes")
        print(f"   Clean size    : {len(clean_text.encode()):,} bytes")
        print(f"   Lines         : {len(lines):,}")


        header_count = len(lines[0].split(","))
        print(f"\n   Header fields : {header_count}")

        mismatched = []
        for i, line in enumerate(lines):
            count = len(line.split(","))
            if count != header_count:
                mismatched.append((i, count, line[:300]))

        if mismatched:
            print(f"\n  {len(mismatched)} rows with wrong field count:")
            for i, count, preview in mismatched:
                print(f"   Line {i}: {count} fields → {preview}")
        else:
            print("All rows have consistent field counts")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
