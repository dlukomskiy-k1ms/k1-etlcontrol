CREATE   PROCEDURE [bronze].[UpdateWatermarkValue]
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
            FROM bronze.Watermark
            WHERE TaskKey = @TaskKey
        )
        BEGIN
            INSERT INTO bronze.Watermark (TaskKey, HighWatermarkValue)
            VALUES (@TaskKey, @NewHighWatermarkValue);
        END

        UPDATE bronze.Watermark
        SET HighWatermarkValue = @NewHighWatermarkValue
        WHERE TaskKey = @TaskKey;
    END
END

GO

