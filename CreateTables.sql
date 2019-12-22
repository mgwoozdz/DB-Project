-- OrderDetails
IF OBJECT_ID('dbo.OrderDetails', 'U') IS NOT NULL
    DROP TABLE dbo.OrderDetails
GO

-- Orders
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders
GO

-- Products
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products
GO

-- Customers
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers
GO

-- Sellers
IF OBJECT_ID('dbo.Sellers', 'U') IS NOT NULL
    DROP TABLE dbo.Sellers
GO


-- Sellers
CREATE TABLE dbo.Sellers
    ( 
        [SellerID] INT IDENTITY(1,1)
        , CONSTRAINT PK_Sellers PRIMARY KEY (SellerID)
        , [SellerName] NVARCHAR(40) NOT NULL
    )
;

-- Customers
CREATE TABLE dbo.Customers
    ( 
        [CustomerID] INT IDENTITY(1,1)NOT NULL
        , CONSTRAINT PK_Customers PRIMARY KEY (CustomerID) 
        , [CustomerName] NVARCHAR(40) NOT NULL
    )
;

-- Products
CREATE TABLE dbo.Products
    ( 
        [ProductID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Products PRIMARY KEY (ProductID) 
        , [ProductName] NVARCHAR(40) NOT NULL
        , [SellerID] INT
        , CONSTRAINT FK_Products_Sellers FOREIGN KEY (SellerID)
          REFERENCES dbo.Sellers (SellerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
    )
;

-- Orders
CREATE TABLE dbo.Orders
    ( 
        [OrderID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
        , [OrderDate] DATETIME NOT NULL
        , [ShippedDate] DATETIME NOT NULL
    )
;

-- Order Details
CREATE TABLE dbo.OrderDetails
    ( 
        [OrderID] INT NOT NULL
        , CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID)
        , CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID)
          REFERENCES dbo.Orders (OrderID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
    )
;















--hehehehehehhehe
-- test3
