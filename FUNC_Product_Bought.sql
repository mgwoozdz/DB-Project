USE TestDB;
GO

DROP FUNCTION IF EXISTS [dbo].[Product Bought];
GO

CREATE FUNCTION dbo.[Product Bought] (@ProductName NVARCHAR(40) = '%')
RETURNS TABLE
AS
RETURN
(
	SELECT *
	FROM dbo.[Products Bought] AS P
	WHERE (P.[Product Name] LIKE @ProductName)
)

GO
