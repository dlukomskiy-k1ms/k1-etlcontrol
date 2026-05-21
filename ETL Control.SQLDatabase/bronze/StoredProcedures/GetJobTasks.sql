CREATE     PROCEDURE [bronze].[GetJobTasks] (
	@JobName NVARCHAR(500) = null
)
AS
with cteJobTasks as (
SELECT
j.JobName, t.TaskKey, t.IsActiveFlag
FROM bronze.Task t 
INNER JOIN bronze.Job j ON j.JobKey = t.JobKey
WHERE t.IsActiveFlag = 1 AND j.JobName = @JobName)

SELECT
STRING_AGG(CAST(c.TaskKey AS NVARCHAR(50)), ',') AS TaskKeys
from cteJobTasks c

GO

