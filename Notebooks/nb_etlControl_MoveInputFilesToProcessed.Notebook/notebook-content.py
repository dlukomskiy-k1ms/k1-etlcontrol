# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {}
# META }

# CELL ********************

# MAGIC %%configure -f
# MAGIC {
# MAGIC     "defaultLakehouse": {  
# MAGIC         "name": { 
# MAGIC             "parameterName": "BronzeLakehouseName", 
# MAGIC             "defaultValue": ""
# MAGIC         },
# MAGIC         "id": { 
# MAGIC             "parameterName": "BronzeLakehouseId", 
# MAGIC             "defaultValue": ""
# MAGIC         },
# MAGIC         "workspaceId": { 
# MAGIC             "parameterName": "BronzeWorkspaceId", 
# MAGIC             "defaultValue": ""
# MAGIC         },
# MAGIC         "workspaceName": { 
# MAGIC             "parameterName": "BronzeWorkspaceName", 
# MAGIC             "defaultValue": ""
# MAGIC         },
# MAGIC     }
# MAGIC }

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# PARAMETERS CELL ********************

BronzeWorkspaceName = ""
BronzeLakehouseName = ""
BronzeWorkspaceId = ""
BronzeLakehouseId = ""
RawStoragePath = ""
RawStorageFileName = "GLJOURNAL*.csv"

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import notebookutils
import glob
from datetime import datetime

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

if "Input" in RawStoragePath:
    processed_storage_path = RawStoragePath.replace("Input", "Processed")
else:
    if RawStoragePath.endswith("/"):
        processed_storage_path = RawStoragePath + "Processed/"
    else:
        processed_storage_path = RawStoragePath + "/Processed/"

print(processed_storage_path)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

InputFolder = f"{RawStoragePath}"
ProcessedFolder = f"{processed_storage_path}"

print(InputFolder)
print(ProcessedFolder)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

raw_files = glob.glob(
    f"/lakehouse/default/{InputFolder}/**/{RawStorageFileName}",
    recursive=True
)

print(raw_files)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

if not raw_files:
    print(f"No folders/files found in {InputFolder}. Exiting notebook.")
    notebookutils.notebook.exit("No folders/files available. Exiting notebook.")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import concurrent.futures

def process_file(file):
    # Skip folders: no dot = folder
    file_name = file.split("/")[-1]
    if "." not in file_name:
        return f"Skipping folder: {file}"

    # Build destination path by replacing /Input with /Processed
    if "Input" in file:
        dest_path = file.replace("Input", "Processed")
    else:
        base_dir = file.rsplit("/", 1)[0]
        file_name = file.split("/")[-1]
        dest_path = f"{base_dir}/Processed/{file_name}"
    dest_dir = dest_path.rsplit("/", 1)[0]

    # Create destination directory if needed
    if not notebookutils.fs.exists(f"file:{dest_dir}"):
        print(f"Creating directory: {dest_dir}")
        notebookutils.fs.mkdirs(f"file:{dest_dir}")

    # If destination file exists, delete it
    if notebookutils.fs.exists(f"file:{dest_path}"):
        print("File exists in destination, deleting first.")
        notebookutils.fs.rm(f"file:{dest_path}", recurse=True)

    # Move the file
    notebookutils.fs.mv(f"file:{file}", f"file:{dest_path}")
    return f"Moved {file} to {dest_dir}"


# -------------------------------
# Run moves concurrently
# -------------------------------
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as executor:
    results = executor.map(process_file, raw_files)

for r in results:
    print(r)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

# Delete any remaining empty folders

print(InputFolder)

# List everything directly under /Input/
for item in notebookutils.fs.ls(InputFolder):
    print(f"Deleting: {item.path}")
    notebookutils.fs.rm(item.path, recurse=True)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark",
# META   "frozen": true,
# META   "editable": false
# META }
