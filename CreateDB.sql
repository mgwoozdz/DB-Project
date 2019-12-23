USE master;
GO

IF DB_ID('TestDB') IS NOT NULL
    DROP DATABASE TestDB;
GO

CREATE DATABASE TestDB;
GO

USE TestDB;
GO

PRINT 'Database created successfully.'

-- Employees
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees
GO

-- Departments
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL
    DROP TABLE dbo.Departments
GO

-- Reviews
IF OBJECT_ID('dbo.Reviews', 'U') IS NOT NULL
    DROP TABLE dbo.Reviews
GO

--Suppliers
IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL
    DROP TABLE dbo.Suppliers
GO

-- OrderDetails
IF OBJECT_ID('dbo.OrderDetails', 'U') IS NOT NULL
    DROP TABLE dbo.OrderDetails
GO

-- Products
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL
    DROP TABLE dbo.Products
GO

-- Orders
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders
GO

--Categories
IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL
    DROP TABLE dbo.Categories
GO

-- Customers
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers
GO

-- Customers
CREATE TABLE dbo.Customers
    ( 
        [CustomerID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Customers PRIMARY KEY (CustomerID) 
        , [Name] NVARCHAR(40) NOT NULL
    )
;

-- Categories
CREATE TABLE dbo.Categories
    (
        [CategoryID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Categories PRIMARY KEY (CategoryID)
        , [CategoryName] NVARCHAR(20) NOT NULL
        , [Description] NTEXT
    )   
;

-- Suppliers
CREATE TABLE dbo.Suppliers
    (
        [SupplierID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID)
        , [SupplierName] NVARCHAR(40) NOT NULL
        , [Country] NVARCHAR(20)
        , [City] NVARCHAR(20)
        , [Address] NVARCHAR(40)
        , [PostalCode] NVARCHAR(10)
        , [EmailAddress] NVARCHAR(30)
        , [Phone] NVARCHAR(20)
    )
;

-- Products
CREATE TABLE dbo.Products
    ( 
        [ProductID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Products PRIMARY KEY (ProductID) 
        , [ProductName] NVARCHAR(40) NOT NULL
        , [SupplierID] INT
        , CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID)
          REFERENCES dbo.Suppliers (SupplierID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [CategoryID] INT
        , CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
          REFERENCES dbo.Categories (CategoryID)
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

-- Reviews
CREATE TABLE dbo.Reviews
    (
        [ReviewID] INT NOT NULL
        , CONSTRAINT PK_Reviews PRIMARY KEY (ReviewID)
        , [CustomerID] INT
        , CONSTRAINT FK_Reviews_Customers FOREIGN KEY (CustomerID)
          REFERENCES dbo.Customers (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT
        , CONSTRAINT FK_Reviews_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Content] NTEXT DEFAULT NULL
        , [Rating] TINYINT NOT NULL
        , CONSTRAINT CK_Reviews_Rating CHECK 
          (Rating >= 1 AND Rating <= 5)   
    )
;

-- Departments
CREATE TABLE dbo.Departments
    (
        [DepartmentID] TINYINT NOT NULL
        , CONSTRAINT PK_Departments PRIMARY KEY (DepartmentID)
        , [DepartmentName] VARCHAR(20) NOT NULL
    )
 ;

-- Employees
CREATE TABLE dbo.Employees
    (
        [EmployeeID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID)
        , [Name] NVARCHAR(20) NOT NULL
        , [Title] NVARCHAR(10) NULL
        , [DepartmentID] TINYINT NOT NULL
        , CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
          REFERENCES dbo.Departments (DepartmentID)
    )
;

PRINT 'Tables created successfully.'

DECLARE @FillTables BIT = 'true'
IF @FillTables = 'true' BEGIN

    SET NOCOUNT ON

    -- Customers
    INSERT INTO dbo.Customers
    VALUES
    ('Jan Nowak')

    SET NOCOUNT OFF

    PRINT 'Tables filled.'
END