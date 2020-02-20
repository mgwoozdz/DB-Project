-- proste wyszukiwanie produktu przez użytkownika na podstawie części nazwy
EXEC [dbo].[Product Lookup] 'Oriflame'
EXEC [dbo].[Product Lookup] 'Orif'
EXEC [dbo].[Product Lookup] 'Av'
EXEC [dbo].[Product Lookup] 'Revlon'


-- dokładniejsze wyszukiwanie na podstawie ściślejszych parametrów
EXEC [dbo].[Search](DEFAULT, 'Paznokcie', DEFAULT, DEFAULT, 20.00)
EXEC [dbo].[Search](DEFAULT, 'Maseczki', 'Peelingi', 20.00, 40.00)


-- sprawdzenie popularnych w sklepie
SELECT * FROM [dbo].[Hot Brands]


-- dodawanie do koszyka
EXEC [dbo].[Add To Cart] 1 1 1
EXEC [dbo].[Add To Cart] 1 2 2
EXEC [dbo].[Add To Cart] 1 3 4


-- zakup
EXEC [dbo].[Buy] 1
EXEC [dbo].[Buy] 14


-- generowanie faktury dla danego zamówienia
EXEC [dbo].[Generate Note] 1
EXEC [dbo].[Generate Note] 3
EXEC [dbo].[Generate Note] 4


-- pobranie przez aplikację webową recenzji na temat produktu do zrenderowania strony
SELECT * FROM [dbo].[Get Reviews] 1
SELECT * FROM [dbo].[Get Reviews] 2
SELECT * FROM [dbo].[Get Reviews] 3
SELECT * FROM [dbo].[Get Reviews] 5


-- sprawdzanie przez pracowników stanu magazynu
SELECT * FROM [dbo].[Storage Status]
SELECT * FROM [dbo].[Storage Status] WHERE STOCK LIKE '0%'
