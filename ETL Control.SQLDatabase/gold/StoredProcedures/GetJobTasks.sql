CREATE    PROCEDURE [gold].[GetJobTasks] (
	@JobName NVARCHAR(500) = null
)
AS
with cteJobTasks as (
SELECT
j.JobName, t.TaskKey, t.IsActiveFlag
FROM gold.Task t 
INNER JOIN gold.Job j ON j.JobKey = t.JobKey
WHERE j.JobName = @JobName AND t.IsActiveFlag = 1)

SELECT
STRING_AGG(CAST(c.TaskKey AS NVARCHAR(50)), ',') AS TaskKeys
from cteJobTasks c

GO

