IF OBJECT_ID('dbo.AddToCart', 'P') IS NOT NULL
BEGIN

DROP PROC dbo.AddToCart
PRINT 'Dropped'
END
GO


CREATE PROC dbo.AddToCart
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


DECLARE @RealQuantity AS INT

Select @RealQuantity = Stock FROM Storage WHERE ProductID = @ProductID;


IF @RealQuantity >= @Quantity
	BEGIN
	IF NOT EXISTS(Select * from [Cart Details] where CartID = @CartID and ProductID = @ProductID)
		BEGIN
		INSERT INTO [Cart details]
		VALUES (@CartID, @ProductId, @Quantity)
		END
	ELSE
		BEGIN
		UPDATE [Cart Details] 
		SET Quantity = Quantity + @Quantity
		where CartID = @CartID and ProductID = @ProductID
		end
		


	UPDATE Storage
	SET Stock = @RealQuantity - @Quantity
	WHERE ProductID = @ProductID 

	END

ELSE
BEGIN
     SET @error = 'Brak wystarczającej ilość produktów w magazynie';
     RAISERROR(@error, 16,1);
     RETURN;
END


