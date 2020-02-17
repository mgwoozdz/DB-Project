USE TestDB;
GO

DROP FUNCTION IF EXISTS [dbo].[Get Reviews];
GO

CREATE FUNCTION [dbo].[Get Reviews] (@ProductID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT [Content] AS [Review], [Rating]
    FROM [dbo].[Reviews]
    WHERE ProductID = @ProductID
)

GO
