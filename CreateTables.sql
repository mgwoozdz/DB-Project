-- Sellers
IF OBJECT_ID('dbo.Sellers', 'U') IS NOT NULL
	DROP TABLE dbo.Sellers
GO
CREATE TABLE dbo.Sellers
	( 
		[SellerID] INT IDENTITY(1,1)
		, [SellerName] NVARCHAR(40) NOT NULL
		, CONSTRAINT PK_Sellers PRIMARY KEY (SellerID)
	)
;

-- Orders
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
	DROP TABLE dbo.Orders
GO
CREATE TABLE dbo.Orders
	( 
		[OrderID] INT IDENTITY(1,1)
	)
;

-- Customers
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
	DROP TABLE dbo.Customers
GO
CREATE TABLE dbo.Customers
	( 
		[CustomerID] INT IDENTITY(1,1)
    	, [CustomerName] NVARCHAR(40) NOT NULL
	)
;

-- Products
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
	DROP TABLE dbo.Products
GO
CREATE TABLE dbo.Products
	( 
		[ProductID] INT IDENTITY(1,1)
    	, [ProductName] NVARCHAR(40) NOT NULL
		, [SellerID] INT
		, CONSTRAINT FK_1 FOREIGN KEY (SellerID)
		  REFERENCES dbo.Sellers (SellerID)
		  ON DELETE CASCADE
          ON UPDATE CASCADE
	)
;