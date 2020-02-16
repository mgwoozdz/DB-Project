USE TestDB
;
GO

DROP VIEW IF EXISTS [dbo].[HotBrands]
;
GO

CREATE VIEW [HotBrands]
AS
SELECT TOP 3 Brands.[Brand Name], SUM(Quantity) AS [Quantity] FROM [Order Details] OD  JOIN Products ON OD.ProductID = Products.ProductID
JOIN Brands ON Products.BrandId = Brands.BrandId
GROUP BY ([Brand Name])
Order by Quantity DESC

;
GO
