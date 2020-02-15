DROP PROC IF EXISTS [dbo].[New Mail]
GO

CREATE PROC [dbo].[New Mail]
@CustomerID INT NOT NULL,
@Topic VARCHAR(50),
