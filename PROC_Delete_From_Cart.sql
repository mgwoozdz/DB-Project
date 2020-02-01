USE TestDB
GO

IF OBJECT_ID('dbo.DeleteFromCart', 'P') IS NOT NULL
DROP PROC dbo.DeleteFromCart
GO

CREATE PROC dbo.DeleteFromCart
@CustomerID INT = NULL,
@ProductID INT = NULL,
@Quantity INT = NULL

AS

DECLARE @error AS NVARCHAR(400);

IF @CustomerID IS NULL OR @ProductID IS NULL OR @Quantity IS NULL 
BEGIN
     SET @error = 'Error!';
     RAISERROR(@error, 16,1);
     RETURN;
END

DECLARE @CartID AS INT;

SELECT @CartID =  CartID
FROM Carts
WHERE CustomerID = @CustomerID

IF NOT EXISTS (Select * From [cart details] where CartID = @CartID and ProductID = @ProductID)
BEGIN
     SET @error = 'Nie ma takiego produktu w koszyku!';
     RAISERROR(@error, 16,1);
     RETURN;
END

DECLARE @QuantityInCart AS INT


Select @QuantityInCart = Quantity FROM [cart details] 
WHERE ProductID = @ProductID and CartID = @CartID;


IF @QuantityInCart >= @Quantity
    BEGIN
	IF @QuantityInCart > @Quantity
		BEGIN
		UPDATE [Cart Details]
		SET Quantity = Quantity - @Quantity
		WHERE ProductID = @ProductID and CartID = @CartID;
		end
	ELSE
		BEGIN 
		DELETE FROM [Cart Details]
		WHERE ProductID = @ProductID and CartID = @CartID;
		END

	UPDATE Storage
	SET Stock = Stock + @Quantity
	WHERE ProductID = @ProductID 
	END

ELSE
    BEGIN
    SET @error = 'Nie masz aż tylu produktów w koszyku!';
     RAISERROR(@error, 16,1);
     RETURN;
    END

go


    
EXEC dbo.DeleteFromCart @CustomerID = 1, @ProductID = 2, @Quantity = 90
GO


