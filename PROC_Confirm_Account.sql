USE TestDB;
GO

DROP PROC IF EXISTS [dbo].[Confirm Account]
GO

CREATE PROC [dbo].[Confirm Account]
@CustomerID INT
AS
IF @CustomerID IS NULL
BEGIN
    DECLARE @error NVARCHAR(50) = 'Error! Account Information missing!';
    RAISERROR(@error, 16,1);
    RETURN;
END

UPDATE [Customers]
SET [Account Confirmed] = 1
WHERE [CustomerID] = @CustomerID

GO