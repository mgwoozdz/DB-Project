USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[ReviewRatings]
GO

CREATE FUNCTION dbo.ReviewRatings (@ReviewID INT)
RETURNS  @Raitings TABLE(
ReviewID INT,
Pluses INT,
Minuses INT
)
AS
BEGIN
DECLARE @Pluses INT
SELECT @Pluses = COUNT(*) FROM [Review Ratings] 
WHERE ReviewID = @ReviewID AND [Plus/Minus] = '+'

DECLARE @Minuses INT
SELECT @Minuses = COUNT(*) FROM [Review Ratings] 
WHERE ReviewID = @ReviewID AND [Plus/Minus] = '-'

INSERT INTO @Raitings VALUES(@ReviewID, @Pluses, @Minuses)

RETURN
END

GO

SELECT * from dbo.ReviewRatings(1)
