USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[AvgProductRate]
GO

CREATE FUNCTION dbo.AvgProductRate (@ProductID INT)
RETURNS FLOAT
AS
BEGIN

DECLARE @AvgRate FLOAT


SELECT @AvgRate =   CAST(AVG(cast(rating as float)) AS DECIMAL(3,2))from Reviews 
WHERE ProductID = @ProductID



RETURN @AvgRate 
END

GO
