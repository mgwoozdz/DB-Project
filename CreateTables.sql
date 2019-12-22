-- Products
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products
GO

-- Sellers
IF OBJECT_ID('dbo.Sellers', 'U') IS NOT NULL
    DROP TABLE dbo.Sellers
GO

-- Orders
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders
GO

-- Customers
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers
GO


-- Sellers
CREATE TABLE dbo.Sellers
    ( 
        [SellerID] INT IDENTITY(1,1)
        , [SellerName] NVARCHAR(40) NOT NULL
        , CONSTRAINT PK_Sellers PRIMARY KEY (SellerID)
    )
;

-- Customers
CREATE TABLE dbo.Customers
    ( 
        [CustomerID] INT IDENTITY(1,1)
        , [CustomerName] NVARCHAR(40) NOT NULL
    )
;

-- Products
CREATE TABLE dbo.Products
    ( 
        [ProductID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL
        , [ProductName] NVARCHAR(40) NOT NULL
        , [SellerID] INT
        , CONSTRAINT FK_1 FOREIGN KEY (SellerID)
          REFERENCES dbo.Sellers (SellerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
    )
;

-- Orders
CREATE TABLE dbo.Orders
    ( 
        [OrderID] INT IDENTITY(1,1) PRIMARY KEY
        , [ProductID] INT NOT NULL
        , CONSTRAINT FK_Orders_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , 
    )
;
