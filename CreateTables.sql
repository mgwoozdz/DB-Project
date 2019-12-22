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

--Categories
IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL
    DROP TABLE dbo.Categories
GO

--Suppliers
IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL
    DROP TABLE dbo.Suppliers
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
        [CustomerID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Customers PRIMARY KEY (CustomerID) 
        , [Name] NVARCHAR(40) NOT NULL
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
        , [CustomerID] INT
        , CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
          REFERENCES dbo.Customers (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [OrderDate] DATETIME NOT NULL
        , [ShippedDate] DATETIME NOT NULL
    )
;

-- Order Details
CREATE TABLE dbo.OrderDetails
    ( 
        [OrderID] INT NOT NULL
        , CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID)
          REFERENCES dbo.Orders (OrderID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [UnitPrice] MONEY NOT NULL
        , [Quantity] INT NOT NULL
        , [Discount] REAL NOT NULL
        , CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
    )
;

--Categories
CREATE TABLE dbo.Categories
    (
        [CategoryID] INT PRIMARY KEY IDENTITY(1,1)
        , [CategoryName] NVARCHAR(20) NOT NULL
        , [Description] NTEXT        
    )
    
;

--Suppliers
CREATE TABLE dbo.Suppliers
    (
        [SupplierID] INT PRIMARY KEY IDENTITY(1,1)
        , [SupplierName] NVARCHAR(40) NOT NULL
        , [Country] NVARCHAR(20)
        , [City] NVARCHAR(20)
        , [Address] NVARCHAR(40)
        , [PostalCode] NVARCHAR(10)
        , [EmailAddress] NVARCHAR(30)
        , [Phone] NVARCHAR(20)
    )
;