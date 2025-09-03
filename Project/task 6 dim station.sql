
IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_station
END

CREATE EXTERNAL TABLE [dbo].[dim_station] WITH(
    LOCATION = 'Star_schemas/dim_station',
    DATA_SOURCE = [abhijeetproject123],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [Station_ID],
        [Name],
        [Latitude],
        [Longitude]
    FROM
        dbo.staging_station
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[dim_station];