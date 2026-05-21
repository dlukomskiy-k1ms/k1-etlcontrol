CREATE    PROCEDURE [gold].[GetTaskTypesByTaskList]
(
    @TaskList NVARCHAR(MAX)
)
AS
BEGIN
    SELECT
        t.TaskKey,
        t.TaskType
    FROM gold.Task t
    INNER JOIN STRING_SPLIT(@TaskList, ',') s
        ON t.TaskKey = CAST(s.value AS INT)
END

GO

