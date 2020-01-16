USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[Search]
GO

CREATE FUNCTION dbo.Search (@BrandName NVARCHAR(20) = '%', @CategoryName NVARCHAR(20) ='%', @Subcategory NVARCHAR(40) ='%', 
							@MinPrice INT = 0, @MaxPrice INT = 10000)
RETURNS TABLE
AS
RETURN
(
	SELECT P.[Product Name], P.[Product Description], B.[Brand Name], C.[Category Name], S.[Subcategory Name], P.[Retail Price] AS Price
	FROM Products AS P
	JOIN Brands AS B 
	ON P.BrandID = B.BrandID
	JOIN Categories AS C
	ON P.CategoryID = C.CategoryID
	JOIN Subcategories AS S
	ON P.SubcategoryID = S.SubcategoryID
	WHERE ( [Brand Name] LIKE @BrandName AND
			[Category Name] LIKE @CategoryName AND
			[Subcategory Name] LIKE @Subcategory AND
			[Retail Price] >= @MinPrice AND
			[Retail Price] <=@MaxPrice
 			)
)
;
GO


SELECT * FROM Search(DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT )
