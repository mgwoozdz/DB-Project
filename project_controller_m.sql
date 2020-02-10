-- create tables
:r C:\Users\Mateusz\Desktop\DB-Project\CreateDB.sql
GO

-- new products trigg
:r C:\Users\Mateusz\Desktop\DB-Project\TRIG_AssignBrandID.sql
GO

-- add customers
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_Customer.sql
GO

-- BUY functionality
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_Review.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_To_Cart.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Buy.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Delete_From_Cart.sql
GO

-- Views
PRINT 'Initiaising Views...'
:r C:\Users\Mateusz\Desktop\DB-Project\VIEW_Products_Bought.sql
GO
PRINT 'Done.'

-- fill
:r C:\Users\Mateusz\Desktop\DB-Project\FillDB.sql
GO



-- testing
GO


SELECT * FROM dbo.[Products Bought]

