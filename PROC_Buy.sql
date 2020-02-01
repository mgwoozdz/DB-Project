USE TestDB
GO

IF OBJECT_ID('dbo.Buy', 'P') IS NOT NULL
DROP PROC dbo.Buy
GO

CREATE PROC dbo.Buy
@CustomerID INT = NULL

AS
DECLARE @EmployeeID INT
SELECT TOP 1 @EmployeeID = EmployeeID FROM Employees
WHERE DepartmentID = 4
ORDER BY NEWID()


DECLARE @CartID AS INT;

SELECT @CartID =  CartID
FROM Carts
WHERE CustomerID = @CustomerID


DECLARE @OrderID INT


INSERT INTO Orders
Values(@CustomerID, GETDATE(), @EmployeeID)
SET @OrderID = @@IDENTITY


DECLARE @ProductID INT
DECLARE @Quantity INT

DECLARE Cart CURSOR
FOR SELECT ProductID, Quantity FROM [Cart Details]
WHERE CartID = @CartID

DECLARE @UnitPrice MONEY


OPEN Cart
Fetch Cart INTO @ProductID, @Quantity

WHILE @@FETCH_STATUS = 0
BEGIN 

    SELECT @UnitPrice = [Retail Price] FROM Products WHERE ProductID = @ProductID

    INSERT INTO [Order Details]
    VALUES(@OrderID, @ProductID, @UnitPrice, @Quantity)
    Fetch Cart INTO @ProductID, @Quantity 
    
END    
CLOSE Cart
DEALLOCATE Cart


DELETE FROM [Cart Details]
WHERE CartID = @CartID

DELETE FROM Carts
WHERE CartID = @CartID

INSERT INTO Carts(CustomerID)
VALUES (@CustomerID)
GO





EXEC dbo.Buy @CustomerID = 1