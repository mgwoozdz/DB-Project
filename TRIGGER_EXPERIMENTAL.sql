USE TestDB;
GO

IF OBJECT_ID('dbo.TestTable', 'U') IS NOT NULL
DROP TABLE dbo.TestTable
GO

CREATE TABLE [dbo].[TestTable]
(
    RowID INT NOT NULL PRIMARY KEY
    , Phrase NVARCHAR(10)
)
;
GO

CREATE TRIGGER [dbo].[TR_AssignBrandID]
    ON [dbo].[TestTable]
    INSTEAD OF INSERT
AS
BEGIN
  SET NOCOUNT ON;

    SELECT *
    FROM INSERTED
END;

INSERT INTO [dbo].[TestTable] VALUES
  ('hehe', 'hehe')
, ('hehehe', 'heheheeee')
