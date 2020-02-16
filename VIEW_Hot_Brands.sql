USE TestDB
;
GO

DROP VIEW IF EXISTS [dbo].[Hot Brands]
;
GO

CREATE VIEW [Hot Brands]
AS
SELECT TOP 3 Brands.[Brand Name], SUM(Quantity) AS [Total Quantity] FROM [Order Details] OD  JOIN Products ON OD.ProductID = Products.ProductID
JOIN Brands ON Products.BrandId = Brands.BrandId
GROUP BY ([Brand Name])
Order by [Total Quantity] DESC

;
GO
