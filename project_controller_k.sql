-- create tables
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\CreateDB.sql
GO

-- new products trigg
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\TRIG_AssignBrandID.sql
GO

-- add customers
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Add_Customer.sql
GO

-- BUY functionality
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Add_Review.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Add_Review_Rating.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Add_To_Cart.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Buy.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\PROC_Delete_From_Cart.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\FUNC_Generate_Note.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\FUNC_Avg_Product_Rate.sql
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\FUNC_Get_Review_Ratings.sql

GO

-- fill
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\FillDB.sql
GO



-- testing
:r C:\Users\pkaro\Desktop\BazyDanych\Projekt\DB-Project\VIEW_Products_Bought.sql
GO


--SELECT * FROM [Products]
--SELECT * FROM [Orders]
--SELECT * FROM [Order Details]
--SELECT * FROM [Products Bought] ORDER BY Quantity DESC
