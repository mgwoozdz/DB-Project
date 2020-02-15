/*

task: notify every subscribed customer about every new produt

for this we need mail functionality

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
    DECLARE @BodyContent VARCHAR(MAX) = 'Nowe produkty! Sprawdź!'
