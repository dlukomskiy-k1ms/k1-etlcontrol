CREATE   PROCEDURE [bronze].[GetTaskTypesByTaskList]
(
    @TaskList NVARCHAR(MAX)
)
AS
BEGIN
    SELECT
        t.TaskKey,
        t.TaskType
    FROM bronze.Task t
    INNER JOIN STRING_SPLIT(@TaskList, ',') s
        ON t.TaskKey = CAST(s.value AS INT)
END

GO

