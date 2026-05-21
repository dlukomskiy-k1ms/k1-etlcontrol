CREATE   PROCEDURE [silver].[UpdateWatermarkValue]
    @IsWatermarkEnabledFlag bit,
    @TaskKey INT,
    @NewHighWatermarkValue VARCHAR(1000)
AS
BEGIN
    SET NOCOUNT ON;

    IF @IsWatermarkEnabledFlag = 1
    BEGIN
        IF NOT EXISTS (
            SELECT 1
            FROM silver.Task
            WHERE TaskKey = @TaskKey
        )
        BEGIN
            THROW 50001, 'No Matching Task Record In silver.Task', 1;
        END

        UPDATE silver.Task
        SET HighWatermarkValue = @NewHighWatermarkValue
        WHERE TaskKey = @TaskKey;
    END
END

GO

