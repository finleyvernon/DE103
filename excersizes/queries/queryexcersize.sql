use clientorders;
GO

SELECT * FROM [dbo].[client]

SELECT * FROM [dbo].[part]
ORDER BY [description];
GO

SELECT [RepFirstname] as 'First Name', [RepLastName] as 'Last Name'
FROM [dbo].[rep];
GO

SELECT CONCAT_WS(' ', c.[firstname], c.[lastname]) as 'Client Name', [city] as 'City'
FROM [dbo].[client] c;
GO

SELECT * FROM [dbo].[client]
WHERE [city] = 'Dunedin';
GO

SELECT * FROM [dbo].[client]
WHERE [city] LIKE 'J%';
GO

SELECT * FROM [dbo].[client]
WHERE [creditlimit] > 900;
GO

SELECT * FROM [dbo].[client]
WHERE [balance] BETWEEN 50 AND 150;
GO

SELECT * FROM [dbo].[client]
WHERE [city] = 'Dunedin' and [balance] < 200;
GO

SELECT [city] FROM [dbo].[client]
WHERE [firstname] = 'Mary' and [lastname] = 'Nelson';
GO

SELECT [firstname], [lastname], [repref] AS 'Rep Number' FROM [dbo].[client]
WHERE [repref] = 6
ORDER BY [lastname];
GO

SELECT [description], [unitPrice] as 'Price' 
FROM [dbo].[part]
WHERE [description] = 'Stove';
GO

SELECT * FROM part

