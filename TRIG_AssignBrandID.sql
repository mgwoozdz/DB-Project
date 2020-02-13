USE TestDB;
GO

DROP TRIGGER IF EXISTS [dbo].[TR_AssignBrandID];
GO

CREATE TRIGGER [dbo].[TR_AssignBrandID]
    ON [dbo].[New Products]
    INSTEAD OF INSERT
AS
BEGIN

    -- add new Brands to Database
    INSERT INTO [dbo].[Brands] ([Brand Name])
	SELECT DISTINCT I.[Brand Name]
	FROM INSERTED AS I
	LEFT JOIN [dbo].[Brands] AS B ON I.[Brand Name] = B.[Brand Name]
	WHERE B.[Brand Name] IS NULL

    -- add new Products with according linking to Brands
    INSERT INTO [dbo].[Products] ([Product Name], [BrandID]
        , [Product Description], [CategoryID], [SubcategoryID]
        , [Wholesale Price], [Retail Price])
    SELECT I.[Product Name], B.[BrandID], I.[Product Description], I.[CategoryID], I.[SubcategoryID], I.[Wholesale Price], I.[Retail Price]
    FROM INSERTED AS I
	JOIN [dbo].[Brands] AS B ON I.[Brand Name] = B.[Brand Name]

END;

GO
