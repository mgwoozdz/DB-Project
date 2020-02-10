USE TestDB
GO

DROP FUNCTION IF EXISTS [dbo].[GenerateNote]
GO

CREATE FUNCTION dbo.GenerateNote (@OrderID INT)
RETURNS @Note TABLE(
    OrderID INT,
    ClientName  NVARCHAR(40),
    Amout MONEY,
    OrderDate Date,
    [Number of Products] INT
)
AS
BEGIN

DECLARE @CustomerName NVARCHAR(40)

SELECT @CustomerName = [Name] from Customers JOIN Orders
ON Orders.CustomerID  = Customers.CustomerID
WHERE Orders.OrderID = @OrderID

DECLARE @Amount MONEY
SELECT @Amount = SUM(UnitPrice * Quantity) FROM [Order Details]
WHERE OrderID  = @OrderID

DECLARE @OrderDate Date
SELECT @OrderDate = [Order Date] from Orders
WHERE OrderID = @OrderID

DECLARE @Quantity INT
SELECT @Quantity = SUM(Quantity) FROM [Order Details]
WHERE OrderID = @OrderID


INSERT INTO @Note
VALUES(@OrderID, @CustomerName, @Amount, @OrderDate, @Quantity)

RETURN 
END



