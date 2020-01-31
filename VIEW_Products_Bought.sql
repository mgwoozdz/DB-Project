USE TestDB
GO

DROP VIEW IF EXISTS [dbo].[Products Bought]
;
GO

CREATE VIEW [Products Bought]
AS
SELECT P.ProductID, SUM(OD.Quantity)
FROM [dbo].[Products] AS P
JOIN [dbo].[Order Details] AS OD
GROUP BY P.ProductID

-- WORK IN PROGRESS