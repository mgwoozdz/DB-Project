USE TestDB;
GO

DROP TRIGGER IF EXISTS [dbo].[Confirmation Email];
GO

CREATE TRIGGER [dbo].[Confirmation Email]
ON [dbo].[Customers]
AFTER INSERT
AS
IF (@@ROWCOUNT = 0)
RETURN;
	
    DECLARE @TopicContent VARCHAR(50) = 'Witamy w Sklepie!'
    DECLARE @BodyContent VARCHAR(MAX) = 
    'Jeszcze tylko jeden krok i możesz cieszyć się zakupami!'
    + 'Wystarczy że potwierdzisz swój adres email.'
    + 'Pozdrawiamy,'
    + 'Ekipa Twojego Sklepu'
    
    DECLARE c CURSOR
    FOR SELECT [CustomerID] FROM INSERTED
    WHERE [Mailing List] = 1 AND [Account Confirmed] = 0

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
