USE TestDB;
GO

DROP FUNCTION IF EXISTS [dbo].[Get Reviews];
GO

CREATE FUNCTION [dbo].[Get Reviews] (@ProductID INT)
RETURNS TABLE(
    SELECT * FROM [dbo].[Reviews]
    WHERE ProductID = @ProductID
)

GO
