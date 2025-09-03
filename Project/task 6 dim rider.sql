IF OBJECT_ID('dbo.dim_rider') IS NOT NULL 
BEGIN
    DROP EXTERNAL TABLE dbo.dim_rider;
END

CREATE EXTERNAL TABLE [dbo].[dim_rider] WITH(
    LOCATION = 'Star_schemas/dim_rider',
    DATA_SOURCE = [abhijeetproject123],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
SELECT
    [Rider_Id],
    [Address],
    [First_Name],
    [Last_Name],
    [Birthday],
    [Account_start_date],
    [Account_end_date],
    [Is_member]
FROM
    dbo.staging_rider
);

Go

SELECT
    TOP 10*
FROM 
    [dbo].[dim_rider];