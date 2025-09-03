
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_trip
END

CREATE EXTERNAL TABLE [dbo].[fact_trip] WITH(
    LOCATION = 'Star_schemas/fact_trip',
    DATA_SOURCE = [abhijeetproject123],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        st.Trip_Id,
        st.rideable_type,
        st.Member_Id,
        st.Started_At,
        st.Ended_At,
        st.Start_Station_Id,
        st.End_Station_Id,
        DATEDIFF(HOUR, st.Started_At, st.Ended_At) AS Duration,
        DateDIFF(YEAR, sr.Birthday, st.Started_At) AS Rider_Age
    FROM
        dbo.staging_trip AS st
        JOIN dbo.staging_rider AS sr
        ON sr.Rider_Id = st.Member_Id
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[fact_trip];