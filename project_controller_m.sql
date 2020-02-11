-- create Tables
:r C:\Users\Mateusz\Desktop\DB-Project\CreateDB.sql
GO

-- Triggers
PRINT 'Deploying Triggers...'
:r C:\Users\Mateusz\Desktop\DB-Project\TRIG_AssignBrandID.sql
GO
PRINT 'Done.'

-- add customers
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_Customer.sql
GO

-- BUY functionality
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_Review.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Add_To_Cart.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Buy.sql
:r C:\Users\Mateusz\Desktop\DB-Project\PROC_Delete_From_Cart.sql
:r C:\Users\Mateusz\Desktop\DB-Project\FUNC_Generate_Note.sql
GO

-- Views
PRINT 'Deploying Views...'
:r C:\Users\Mateusz\Desktop\DB-Project\VIEW_Products_Bought.sql --TESTED
GO
PRINT 'Done.'

-- fill
:r C:\Users\Mateusz\Desktop\DB-Project\FillDB.sql
GO


-- testing
--SELECT * FROM dbo.[Products Bought]

