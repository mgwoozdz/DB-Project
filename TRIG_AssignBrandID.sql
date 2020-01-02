USE TestDB;
GO

DROP TABLE IF EXISTS [dbo].[New Products];
GO

-- temporary table for new products
CREATE TABLE [dbo].[New Products]
(
    [Brand Name] NVARCHAR(20)
    , [Product Name] NVARCHAR(40) NOT NULL
    , [Product Description] NVARCHAR(100)
    , [CategoryID] TINYINT
    , [SubcategoryID] TINYINT
    , [Wholesale Price] MONEY NOT NULL
    , [Retail Price] MONEY NOT NULL
)
;
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

-- quick test
INSERT INTO [dbo].[New Products] VALUES
  ('Revlon', 'Colorstay', 'podkład z pompką do cery tłustej i mieszanej, 30 ml', 1, 1, 24, 48.99 )
, ('Gosh', 'X-CEPTIONAL WEAR', 'kryjący podkład do twarzy w kremie do twarzy, 35 ml', 1, 1, 21, 41.99)

SELECT * FROM [dbo].[Brands]
SELECT * FROM [dbo].[Products]