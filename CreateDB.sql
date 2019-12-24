/* CREATE DATABASE */
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

/* CREATE TABLES */
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

-- Products
CREATE TABLE dbo.Products
    ( 
        [ProductID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Products PRIMARY KEY (ProductID) 
        , [ProductName] NVARCHAR(40) NOT NULL
        , [CategoryID] INT
        , CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
          REFERENCES dbo.Categories (CategoryID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
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
        , [PostalCode] NVARCHAR(6)
        , [EmailAddress] NVARCHAR(30)
        , [Phone] NVARCHAR(20)
    )
;

-- Resupplies
CREATE TABLE dbo.Resupplies
    (
        [ResupplyID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT PK_Resupplies PRIMARY KEY (ResupplyID)
        , [SupplierID] INT NOT NULL
        , CONSTRAINT FK_Resupplies_Suppliers FOREIGN KEY (SupplierID)
          REFERENCEs dbo.Suppliers (SupplierID)
          ON DELETE CASCADE
          ON UPDATE CASCADE         
    )
;

-- ResupplyDetails
CREATE TABLE dbo.ResupplyDetails
    (
        [ResupplyID] INT NOT NULL
        , CONSTRAINT FK_ResupplyDetails_Resupplies FOREIGN KEY (ResupplyID)
          REFERENCEs dbo.Resupplies (ResupplyID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT FK_ResupplyDetails_Products FOREIGN KEY (ProductID)
          REFERENCEs dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Quantity] SMALLINT NOT NULL
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
        , [Quantity] SMALLINT NOT NULL
        , [Discount] REAL NOT NULL
        , CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
    )
;

-- Reviews
CREATE TABLE dbo.Reviews
    (
        [CustomerID] INT NOT NULL
        , CONSTRAINT FK_Reviews_Customers FOREIGN KEY (CustomerID)
          REFERENCES dbo.Customers (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT FK_Reviews_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Content] NTEXT DEFAULT NULL
        , [Rating] TINYINT NOT NULL
        , CONSTRAINT CK_Reviews_ValidRating CHECK 
          (Rating >= 1 AND Rating <= 5)   
        , CONSTRAINT PK_Reviews PRIMARY KEY (CustomerID, ProductID)
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
        , [Name] NVARCHAR(40) NOT NULL
        , [DepartmentID] TINYINT
        , CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
          REFERENCES dbo.Departments (DepartmentID)
    )
;

--  Storage
CREATE TABLE dbo.Storage
    (
        [ProductID] INT NOT NULL
        , CONSTRAINT FK_Storage_Products FOREIGN KEY (ProductID)
          REFERENCES dbo.Products (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [StockMax] INT NOT NULL
        , CONSTRAINT CK_Storage_StockMaxValid CHECK ( StockMax > 0 )
        , [Stock] INT NOT NULL
        , CONSTRAINT CK_Storage_StockValid CHECK ( Stock BETWEEN 0 AND StockMax )
    )

;

PRINT 'Tables created successfully.'

/* FILL TABLES WITH DATA*/
DECLARE @FillTables BIT = 'true'

IF @FillTables = 'true' BEGIN

    INSERT INTO dbo.Departments VALUES
      (1, 'Management')
    , (2, 'IT')
    , (3, 'Sales')
    ;

    INSERT INTO dbo.Employees VALUES
	  ('Eryk Sorensen', 2)
	, ('Elif Jensen', 3)
	, ('Eliza Moller', 2)
	, ('Elisabeth Christiansen', 1)
	, ('Edward Larsen', 1)
	, ('Emanuel Poulsen', 3)
	, ('Eugeniusz Johansen', 3)
	, ('Eryk Pedersen', 3)
	, ('Elif Olsen', 2)
	, ('Elzna Jorgensen', 1)
	;

    INSERT INTO dbo.Customers
    VALUES
      ('Celina Johansen')
    , ('Cyryl Jensen')
    , ('Cameron Moller')
    , ('Carolina Moller')
    , ('Cyryl Andersen')
    , ('Cataleya Pedersen')
    , ('Chanell Moller')
    , ('Carmen Moller')
    , ('Carla Christiansen')
    , ('Cyprian Moller')
    ;

    PRINT 'Tables filled successfully.'
END