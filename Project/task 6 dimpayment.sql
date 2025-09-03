CREATE EXTERNAL TABLE [dbo].[dim_payment]
WITH (
    LOCATION = 'Star_schemas/dim_payment/',   
    DATA_SOURCE = [abhijeetproject123],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
AS
SELECT
    PaymentID,
    PaymentDate,
    Amount,
    AccountNumber,
    DATEPART(DAY,   CONVERT(Date, PaymentDate)) AS DAY,
    DATEPART(MONTH, CONVERT(Date, PaymentDate)) AS MONTH, 
    DATEPART(QUARTER, CONVERT(Date, PaymentDate)) AS QUARTER,
    DATEPART(YEAR,  CONVERT(Date, PaymentDate)) AS YEAR,
    DATEPART(DAYOFYEAR, CONVERT(Date, PaymentDate)) AS DAY_OF_YEAR,
    DATEPART(WEEKDAY,  CONVERT(Date, PaymentDate)) AS DAY_OF_WEEK
FROM dbo.staging_payment;
GO
