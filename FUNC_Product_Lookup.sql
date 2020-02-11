USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[Product Lookup]
GO

CREATE FUNCTION dbo.[Product Lookup] (@ProductName NVARCHAR(40) = '%')
RETURNS TABLE
AS
RETURN
(
	SELECT Pr.[Product Name], Br.[Brand Name] AS [Brand], Ss.[Stock] AS [Availability]
	FROM dbo.[Storage Status] AS Ss
	JOIN dbo.[Products] AS Pr ON SS.[ProductID] = Pr.[ProductID]
	JOIN dbo.[Brands] AS Br ON Pr.[BrandID] = Br.[BrandID]
	WHERE Ss.[Product Name] LIKE @ProductName + '%'
)
;
GO

-- TODO: NEEDS TESTING
