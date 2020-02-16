USE TestDB;
GO

DROP TRIGGER IF EXISTS [dbo].[Storage Alert];
GO

CREATE TRIGGER [dbo].[Storage Alert]
ON [dbo].[Storage]
AFTER UPDATE
AS

IF NOT EXISTS (
SELECT *
FROM [dbo].[Storage]
WHERE [Stock] = 0)
    RETURN;

SELECT FORMATMESSAGE('Alert! Some products are out of stock! Notify Logistics Dep.')
    AS [System Notification];

GO

    