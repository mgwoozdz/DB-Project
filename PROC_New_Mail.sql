USE TestDB;
GO

DROP PROC IF EXISTS [dbo].[New Mail];
GO

CREATE PROC [dbo].[New Mail]
@CustomerID INT,
@Topic VARCHAR(50),
@Body VARCHAR(MAX)
AS
BEGIN

    IF @CustomerID IS NULL OR @Topic IS NULL OR @Body IS NULL
    BEGIN
        DECLARE @error NVARCHAR(50) = 'Error! Mail elements missing!';
        RAISERROR(@error, 16,1);
        RETURN;
    END

    INSERT INTO [dbo].[Mail Queue]
    ([RecipentID], [Topic], [Body])
    VALUES
    (@CustomerID, @Topic, @Body)

END

GO
