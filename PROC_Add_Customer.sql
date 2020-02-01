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

EXEC dbo.AddCustomer @Name = 'Celina Johansen', @Email = 'celinajohansen@gmail.com', @PhoneNumber = '123456789', 
@Addres = 'Skarbowa 16', @PostalCode =  '30-056', @City = 'Krakow'
GO

EXEC dbo.AddCustomer @Name = 'Cyryl Jensen', @Email = 'cJensen@gmail.com', @PhoneNumber = '222333444', 
@Addres = 'Lipowa 18/2', @PostalCode = '12-819', @City = 'Warszawa'
GO

EXEC dbo.AddCustomer @Name = 'Cameron Moller', @Email = 'mollercameron@wp.pl', @PhoneNumber =  '367235980', 
@Addres = 'Lea 13', @PostalCode = '26-600', @City = 'Radom'
GO


