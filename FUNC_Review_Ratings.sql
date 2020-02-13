USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[ReviewRatings]
GO

CREATE FUNCTION dbo.ReviewRatings (@ReviewID INT)
RETURNS TABLE
AS
BEGIN




RETURN SELECT RR1.ReviewID, RR1.COUNT(*) AS Pluses, P.Minues FROM [Review Ratings] AS RR1 JOIN (SELECT ReviewID, COUNT(*) AS Minues FROM 
[Review Ratings] GROUP BY ReviewID WHERE [Plus/Minus] = '-') AS P ON RR1.ReviewID P.ReviewID
WHERE RR1.[Plus/Minus] ='+'
END

GO
