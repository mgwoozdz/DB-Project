-- create DB
PRINT 'Creating Database...'
:r <path>\DB-Project\CreateDB.sql
GO
PRINT 'Database created.
	'

	
PRINT 'Deploying Views...'
:r <path>\DB-Project\VIEW_Products_Bought.sql
:r <path>\DB-Project\VIEW_Storage_Status.sql
:r <path>\DB-Project\VIEW_Hot_Brands.sql
:r <path>\DB-Project\VIEW_Category_Organisation.sql
GO
PRINT 'Views deployed.
	'


PRINT 'Deploying Procedures...'
:r <path>\DB-Project\PROC_Add_Customer.sql
:r <path>\DB-Project\PROC_Add_Review.sql
:r <path>\DB-Project\PROC_Add_Review_Rating.sql
:r <path>\DB-Project\PROC_Add_To_Cart.sql
:r <path>\DB-Project\PROC_Buy.sql
:r <path>\DB-Project\PROC_Delete_From_Cart.sql
:r <path>\DB-Project\PROC_New_Mail.sql
:r <path>\DB-Project\PROC_Confirm_Account.sql
GO
PRINT 'Procedures deployed.
	'


PRINT 'Deploying Functions...'
:r <path>\DB-Project\FUNC_Generate_Note.sql
:r <path>\DB-Project\FUNC_Product_Bought.sql
:r <path>\DB-Project\FUNC_Product_Lookup.sql
:r <path>\DB-Project\FUNC_Get_Review_Ratings.sql
:r <path>\DB-Project\FUNC_Get_Reviews.sql
GO
PRINT 'Functions deployed.
	'


PRINT 'Deploying Triggers...'
:r <path>\DB-Project\TRIG_AssignBrandID.sql
:r <path>\DB-Project\TRIG_Guard_Categories.sql
:r <path>\DB-Project\TRIG_New_Product_Notification.sql
:r <path>\DB-Project\TRIG_Confirmation_Email.sql
:r <path>\DB-Project\TRIG_Stock_Alert.sql
GO
PRINT 'Triggers deployed.
	'
	

PRINT 'Filling Tables...'
:r <path>\DB-Project\FillDB.sql
GO
PRINT '
Tables Filled.
	'
GO
