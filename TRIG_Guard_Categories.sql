USE TestDB;
GO

DROP TRIGGER IF EXISTS [dbo].[Guard Categories];
GO

CREATE TRIGGER [dbo].[Guard Categories] ON [dbo].[Categories]
INSTEAD OF DELETE, UPDATE
AS
IF (@@ROWCOUNT = 0)
RETURN;
	RAISERROR ('Action prohibited. This incident will be reported.', 16, 0)
	ROLLBACK
GO
