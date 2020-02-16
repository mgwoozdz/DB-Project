USE TestDB;
GO

DROP VIEW IF EXISTS [dbo].[Products Bought];
GO

CREATE VIEW [Products Bought]
AS
SELECT B.[Brand Name] AS [Brand], P.[Product Name], Pr.[Quantity]
FROM Products AS P
JOIN (SELECT P.ProductID, SUM(OD.Quantity) AS [Quantity]
    FROM [dbo].[Products] AS P
    JOIN [dbo].[Order Details] AS OD ON P.ProductID = OD.ProductID
    GROUP BY P.ProductID) AS Pr ON P.ProductID = Pr.ProductID
JOIN [dbo].[Brands] AS B ON P.BrandID = B.BrandID

GO
