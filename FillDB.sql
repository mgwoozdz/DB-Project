/* FILL TABLES */

SET NOCOUNT ON

PRINT 'Initialising Customers...'
INSERT INTO [dbo].[Customers]
VALUES
  ('Celina Johansen')
, ('Cyryl Jensen')
, ('Cameron Moller')
, ('Carolina Moller')
, ('Cyryl Andersen')
, ('Cataleya Pedersen')
, ('Chanell Moller')
, ('Carmen Moller')
, ('Carla Christiansen')
, ('Cyprian Moller')
;
PRINT 'Done.
'

PRINT 'Initialising Categories...'
INSERT INTO [dbo].[Categories] VALUES
  (1, 'Twarz')
, (2, 'Usta')
, (3, 'Oczy')
, (4, 'Brwi')
, (5, 'Paznokcie')
, (6, 'Akcesoria')
, (7, 'Dermokosmetyki')
, (8, 'Zestawy')
;
PRINT 'Done.
'

PRINT 'Initialising Subcategories...'
INSERT INTO [dbo].[Subcategories] VALUES
-- Twarz
  (1, 'Podkłady')
, (1, 'Pudry')
, (1, 'Korektory')
, (1, 'Rozświetlacze i bronzery')
, (1, 'Róże')
, (1, 'Kremy BB i CC')
, (1, 'Bazy pod makijaż')
, (1, 'Spraye utrwalające makijaż')
, (1, 'Pędzle do makijażu')
, (1, 'Akcesoria')
-- Usta
, (2, 'Błyszczyki')
, (2, 'Pomadki do ust')
, (2, 'Konturówki do ust')
, (2, 'Pędzle do ust')
-- Oczy
, (3, 'Tusze do rzęs')
, (3, 'Bazy i cienie do powiek')
, (3, 'Paletki cieni')
, (3, 'Kredki do oczu i eyelinery')
, (3, 'Sztuczne rzęsy')
, (3, 'Odżywki do rzęs')
, (3, 'Pędzle do oczu')
, (3, 'Akcesoria')
-- Brwi
, (4, 'Kredki do brwi')
, (4, 'Cienie')
, (4, 'Korektory do brwi')
, (4, 'Maskary, żele, woski, pomady, henna')
, (4, 'Pędzle do brwi')
, (4, 'Akcesoria')
-- Paznokcie
, (5, 'Lakiery do paznokci')
, (5, 'Lakiery hybrydowe')
, (5, 'Pielęgnacja')
, (5, 'Zmywacze')
, (5, 'Zdobienie paznokci')
, (5, 'Bazy i utwardzanie, top coat')
, (5, 'Sztuczne paznokcie')
, (5, 'Akcesoria')
-- Akcesoria
, (6, 'Do twarzy')
, (6, 'Do ust')
, (6, 'Do oczu')
, (6, 'Do paznokci')
, (6, 'Pędzle do makijażu')
, (6, 'Kosmetyczki')
-- Dermokosmetyki nie mają podkategorii
-- Zestawy też nie mają podkategorii
;
PRINT 'Done.
'

PRINT 'Initialising Brands...'
INSERT INTO [dbo].[Brands] VALUES
  ('Hello Kitty') -- test
PRINT 'Done.
'


PRINT 'Initialising Products...'
INSERT INTO [dbo].[New Products] VALUES
  ('Revlon', 'Colorstay', 'podkład z pompką do cery tłustej i mieszanej, 30 ml', 1, 1, 24, 48.99)
, ('Gosh', 'X-CEPTIONAL WEAR', 'kryjący podkład do twarzy w kremie do twarzy, 35 ml', 1, 1, 21, 41.99) --Gosh
, ('Anabelle Minerals', 'GOLDEN FAIREST', 'podkład matujący do twarzy, 4 g', 1, 1, 22, 44.99) -- Annabelle
, ('Catrice','HD LIQUID COVERAGE', 'podkład do twarzy, 30 ml', 1, 1, 10, 23.19) -- Catrice
PRINT 'Done. 
'

PRINT 'Initialising Departments...'
INSERT INTO [dbo].[Departments] VALUES
  (1, 'Management')
, (2, 'IT')
, (3, 'Sales')
, (4, 'Packaging')
;
PRINT 'Done.
'

PRINT 'Initialising Employees...'
INSERT INTO [dbo].[Employees] VALUES
  ('Eryk Sorensen', 4)
, ('Elif Jensen', 3)
, ('Eliza Moller', 2)
, ('Elisabeth Christiansen', 1)
, ('Edward Larsen', 1)
, ('Emanuel Poulsen', 3)
, ('Eugeniusz Johansen', 3)
, ('Eryk Pedersen', 4)
, ('Elif Olsen', 4)
, ('Elzna Jorgensen', 4)
PRINT 'Done.
'

PRINT 'Initialising Storage...'
INSERT INTO [dbo].[Storage] VALUES
  (1, 1000, 1000)
, (2, 1000, 1000)
, (3, 1000, 1000)
PRINT 'Done.
'

SET NOCOUNT OFF

PRINT 'Tables filled successfully.'

/* /FILL TABLES */
--------------------------------------------------------------------
