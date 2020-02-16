USE TestDB;
GO

DROP VIEW IF EXISTS [dbo].[Category Organisation];
GO

CREATE VIEW [Category Organisation]
AS
SELECT C.CategoryID, C.[Category Name], S.SubcategoryID, S.[Subcategory Name]
FROM [dbo].[Categories] AS C
LEFT JOIN [dbo].[Subcategories] AS S ON C.CategoryID = S.CategoryID

GO
