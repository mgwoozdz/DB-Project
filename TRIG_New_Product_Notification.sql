/*
task: notify every subscribed customer about every new produt
meaning: send mail after every insert to Products table
*/

USE TestDB;
GO

DROP TRIGGER IF EXISTS [dbo].[New Product Notification];
GO

CREATE TRIGGER [dbo].[New Product Notification]
ON [dbo].[Products]
AFTER INSERT
AS
IF (@@ROWCOUNT = 0)
RETURN;
	
    DECLARE @TopicContent VARCHAR(50) = 'Newsletter sklepu'
    DECLARE @BodyContent VARCHAR(MAX) = 'Nowe produkty dostępne już dziś! Sprawdź!'

    DECLARE c CURSOR
    FOR SELECT [CustomerID] FROM [dbo].[Customers]
    WHERE [Mailing List] = 1 AND [Account Confirmed] = 1

    DECLARE @cID INT

    OPEN c
    FETCH c INTO @cID

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC [dbo].[New Mail] @cID, @TopicContent, @BodyContent

        FETCH c INTO @cID
    END

    CLOSE c
    DEALLOCATE c

GO
