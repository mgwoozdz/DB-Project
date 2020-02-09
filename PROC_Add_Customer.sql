USE TestDB
GO

IF OBJECT_ID('dbo.AddCustomer', 'P') IS NOT NULL
DROP PROC dbo.AddCustomer
GO

CREATE PROC dbo.AddCustomer

@Name NVARCHAR(40) = NULL,
@Email NVARCHAR(40) = NULL,
@PhoneNumber NVARCHAR(5) = NULL,
@Addres NVARCHAR(40) = NULL,
@PostalCode NVARCHAR(15) = NULL,
@City NVARCHAR(25) = NULL

AS

DECLARE @error AS NVARCHAR(400);

IF @Name IS NULL OR @Email IS NULL 
BEGIN
     SET @error = 'Error!';
     RAISERROR(@error, 16,1);
     RETURN;
END

INSERT INTO Customers([Name], [Email Addres], [Phone Number], [Addres], [Postal Code], City)
VALUES (@Name, @Email, @PhoneNumber, @Addres, @PostalCode, @City);


INSERT INTO Carts(CustomerID)
VALUES ((SELECT CustomerID FROM Customers WHERE [Email Addres] = @Email))
GO

