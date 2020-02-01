/* CREATE DATABASE */

PRINT 'Creating Database...'
GO

USE master;
GO

IF DB_ID('TestDB') IS NOT NULL
    DROP DATABASE TestDB;
GO

CREATE DATABASE TestDB;
GO

PRINT 'Done.
    '
GO

PRINT 'Switching to database...'
GO

USE TestDB;
GO

PRINT 'Done.
    '
GO
/* /CREATE DATABASE */
--------------------------------------------------------------------
/* CREATE TABLES */

-- -- /* FIRST DROP TABLES*/
PRINT 'Performing cleanup...'
GO

DROP TABLE IF EXISTS [dbo].[Brands] ;
GO

DROP TABLE IF EXISTS [dbo].[Cart Details] ;
GO

DROP TABLE IF EXISTS [dbo].[Carts] ;
GO

DROP TABLE IF EXISTS [dbo].[Customers] ;
GO

DROP TABLE IF EXISTS [dbo].[Categories] ;
GO

DROP TABLE IF EXISTS [dbo].[Subcategories] ;
GO

DROP TABLE IF EXISTS [dbo].[Products] ;
GO

DROP TABLE IF EXISTS [dbo].[Suppliers] ;
GO

DROP TABLE IF EXISTS [dbo].[Resupplies] ;
GO

DROP TABLE IF EXISTS [dbo].[Resupply Details] ;
GO

DROP TABLE IF EXISTS [dbo].[Orders] ;
GO

DROP TABLE IF EXISTS dbo.[Order Details] ;
GO

DROP TABLE IF EXISTS [dbo].[Reviews] ;
GO

DROP TABLE IF EXISTS [dbo].[Review Ratings] ;
GO

DROP TABLE IF EXISTS [dbo].[Departments] ;
GO

DROP TABLE IF EXISTS [dbo].[Employees] ;
GO

DROP TABLE IF EXISTS [dbo].[Storage] ;
GO

DROP TABLE IF EXISTS [dbo].[New Products] ;
GO


PRINT 'Done.
    '
GO
-- -- /* /FIRST DROP TABLES*/

PRINT 'Creating tables...'
GO

-- Customers
CREATE TABLE [dbo].[Customers]
    ( 
        [CustomerID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Customers] PRIMARY KEY (CustomerID) 
        , [Name] NVARCHAR(40) NOT NULL
        , [Email Addres] NVARCHAR(40) NOT NULL UNIQUE
        , [Phone Number] NVARCHAR(15) 
        , [Addres] NVARCHAR(40)
        , [Postal Code] NVARCHAR(8)
        , [City] NVARCHAR(25)
     )
;
GO

-- Categories
CREATE TABLE [dbo].[Categories]
    (
        [CategoryID] TINYINT NOT NULL
        , CONSTRAINT [PK_Categories] PRIMARY KEY (CategoryID)
        , [Category Name] NVARCHAR(20) NOT NULL
    )   
;
GO

-- Subcategories
CREATE TABLE [dbo].[Subcategories]
    (
        [CategoryID] TINYINT NOT NULL
        , CONSTRAINT [FK_Subcategories_Categories] FOREIGN KEY (CategoryID)
          REFERENCES [dbo].[Categories] (CategoryID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [SubcategoryID] TINYINT IDENTITY(1,1) NOT NULL UNIQUE
        , [Subcategory Name] NVARCHAR(40) NOT NULL
        , CONSTRAINT [PK_Subcategories] PRIMARY KEY (CategoryID, SubcategoryID)
    )
;
GO

-- Brands
CREATE TABLE [dbo].[Brands]
    (
        [BrandID] INT IDENTITY(1,1)
        , CONSTRAINT [PK_Brands] PRIMARY KEY (BrandID)
        , [Brand Name] NVARCHAR(20) NOT NULL
    )
;
GO



-- Products
CREATE TABLE [dbo].[Products]
    ( 
        [ProductID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Products] PRIMARY KEY (ProductID) 
        , [Product Name] NVARCHAR(40) NOT NULL
        , [BrandID] INT NOT NULL
        , [Product Description] NVARCHAR(100)
        , [CategoryID] TINYINT
        , CONSTRAINT [FK_Products_Categories] FOREIGN KEY (CategoryID)
          REFERENCES [dbo].[Categories] (CategoryID)
          ON DELETE SET NULL
          ON UPDATE CASCADE 
        , [SubcategoryID] TINYINT
        , CONSTRAINT [FK_Products_Subcategories] FOREIGN KEY (SubcategoryID)
          REFERENCES [dbo].[Subcategories] (SubcategoryID)
        , [Wholesale Price] MONEY NOT NULL  -- TODO trigger: price >=0
        , [Retail Price] MONEY NOT NULL  -- TODO trigger
    )
;
GO

-- temporary table for adding new products
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


-- Suppliers
CREATE TABLE [dbo].[Suppliers]
    (
        [SupplierID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Suppliers] PRIMARY KEY (SupplierID)
        , [SupplierName] NVARCHAR(40) NOT NULL
        , [Country] NVARCHAR(20)
        , [City] NVARCHAR(20)
        , [Address] NVARCHAR(40)
        , [PostalCode] NVARCHAR(6)
        , [EmailAddress] NVARCHAR(30)
        , [Phone] NVARCHAR(20)
    )
;
GO

-- Resupplies
CREATE TABLE [dbo].[Resupplies]
    (
        [ResupplyID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Resupplies] PRIMARY KEY (ResupplyID)
        , [SupplierID] INT NOT NULL
        , CONSTRAINT [FK_Resupplies_Suppliers] FOREIGN KEY (SupplierID)
          REFERENCEs [dbo].[Suppliers] (SupplierID)
          ON DELETE CASCADE
          ON UPDATE CASCADE         
    )
;
GO

-- ResupplyDetails
CREATE TABLE [dbo].[Resupply Details]
    (
        [ResupplyID] INT NOT NULL
        , CONSTRAINT [FK_ResupplyDetails_Resupplies] FOREIGN KEY (ResupplyID)
          REFERENCEs [dbo].[Resupplies] (ResupplyID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT [FK_ResupplyDetails_Products] FOREIGN KEY (ProductID)
          REFERENCEs [dbo].[Products] (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Quantity] SMALLINT NOT NULL
    )
;
GO

-- Orders
CREATE TABLE [dbo].[Orders]
    ( 
        [OrderID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Orders] PRIMARY KEY (OrderID)
        , [CustomerID] INT
        , CONSTRAINT [FK_Orders_Customers] FOREIGN KEY (CustomerID)
          REFERENCES [dbo].[Customers] (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Order Date] DATETIME
        , [EmployeeID] INT 
        , CONSTRAINT [FK_Orders_Employees] FOREIGN KEY (EmployeeID)
          REFERENCES [dbo].[Employees] (EmployeeID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        
    )
;
GO

-- Order Details
CREATE TABLE [dbo].[Order Details]
    ( 
        [OrderID] INT NOT NULL
        , CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY (OrderID)
          REFERENCES [dbo].[Orders] (OrderID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY (ProductID)
          REFERENCES [dbo].[Products] (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [UnitPrice] MONEY 
        , [Quantity] SMALLINT NOT NULL
        , CONSTRAINT [PK_OrderDetails] PRIMARY KEY (OrderID, ProductID)
    )
;
GO

-- Reviews
CREATE TABLE [dbo].[Reviews]
    (
        [ReviewID] INT IDENTITY(1,1) NOT NULL UNIQUE
        , [CustomerID] INT NOT NULL
        , CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY (CustomerID)
          REFERENCES [dbo].[Customers] (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT [FK_Reviews_Products] FOREIGN KEY (ProductID)
          REFERENCES [dbo].[Products] (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [Content] NTEXT
        , [Rating] TINYINT NOT NULL
        , CONSTRAINT [CK_Reviews_ValidRating] CHECK 
          (Rating >= 1 AND Rating <= 5)   
        , CONSTRAINT [PK_Reviews] PRIMARY KEY (CustomerID, ProductID)
    )
;
GO

-- Review Ratings
-- customer can 'thumbUp' a review to mark it as helpful
CREATE TABLE [dbo].[Review Ratings]
    (
        [ReviewID] INT NOT NULL
        , CONSTRAINT [FK_ReviewRatings_Reviews] FOREIGN KEY (ReviewID)
          REFERENCES [dbo].[Reviews] (ReviewID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [CustomerID] INT NOT NULL
        , CONSTRAINT [FK_ReviewRatings_Customers] FOREIGN KEY (CustomerID)
          REFERENCES [dbo].[Customers] (CustomerID)
    )
;
GO

-- Departments
-- Employee can be assigned to a department
CREATE TABLE [dbo].[Departments]
    (
        [DepartmentID] TINYINT NOT NULL
        , CONSTRAINT [PK_Departments] PRIMARY KEY (DepartmentID)
        , [DepartmentName] VARCHAR(20) NOT NULL
    )
;
GO

-- Employees
CREATE TABLE [dbo].[Employees]
    (
        [EmployeeID] INT IDENTITY(1,1) NOT NULL
        , CONSTRAINT [PK_Employees] PRIMARY KEY (EmployeeID)
        , [Name] NVARCHAR(40) NOT NULL UNIQUE
        , [DepartmentID] TINYINT DEFAULT NULL
        , CONSTRAINT [FK_Employees_Departments] FOREIGN KEY (DepartmentID)
          REFERENCES [dbo].[Departments] (DepartmentID)
          ON DELETE SET NULL
          ON UPDATE CASCADE
    )
;
GO

-- Storage
-- every item has to be stored in Storage
CREATE TABLE [dbo].[Storage]
    (
        -- every product has only one spot in storage
        [ProductID] INT NOT NULL UNIQUE
        , CONSTRAINT [FK_Storage_Products] FOREIGN KEY (ProductID)
          REFERENCES [dbo].[Products] (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [StockMax] INT NOT NULL
        , CONSTRAINT [CK_Storage_StockMaxValid] CHECK ( StockMax > 0 )  -- TODO trigger
        , [Stock] INT NOT NULL
        , CONSTRAINT [CK_Storage_StockValid] CHECK ( Stock BETWEEN 0 AND StockMax ) -- TODO trigger
    )

;
GO

-- Carts
-- every user, while shopping, adds items to Cart.
-- Orders are made by ordering what is currently in a Cart
CREATE TABLE [dbo].[Carts]
    (
        [CartID] INT IDENTITY(1,1)
        , CONSTRAINT [PK_Carts] PRIMARY KEY (CartID)
        -- every customer can have only one cart at the time
        , [CustomerID] INT NOT NULL UNIQUE
        , CONSTRAINT [FK_Carts_Customers] FOREIGN KEY (CustomerID)
          REFERENCES [dbo].[Customers] (CustomerID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
    )
;
GO

-- Cart Details
CREATE TABLE [dbo].[Cart Details]
    (
        [CartID] INT NOT NULL
        , CONSTRAINT [FK_CartDetails_Carts] FOREIGN KEY (CartID)
          REFERENCES [dbo].[Carts] (CartID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , [ProductID] INT NOT NULL
        , CONSTRAINT [FK_CartDetails_Products] FOREIGN KEY (ProductID)
          REFERENCES [dbo].[Products] (ProductID)
          ON DELETE CASCADE
          ON UPDATE CASCADE
        , CONSTRAINT [PK_CartDetails] PRIMARY KEY (CartID, ProductID)
        , [Quantity] INT NOT NULL
    )
;
GO

PRINT 'Done.
    '
GO
/* /CREATE TABLES */
--------------------------------------------------------------------
