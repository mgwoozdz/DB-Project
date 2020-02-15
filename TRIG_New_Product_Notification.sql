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
	