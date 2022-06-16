-- Query 2

SELECT [firstname], [lastname], [city] FROM [dbo].[client]
WHERE [city] like 'Dunedin';
GO

-- Query 3

SELECT [firstname], [lastname] FROM [dbo].[client]
WHERE [lastname] like 'J%';
GO

-- Query 4

SELECT [firstname], [lastname], [balance] FROM [dbo].[client]
WHERE [balance] BETWEEN 50 AND 150;
GO

-- Query 5

SELECT [firstname], [lastname], [city] FROM [dbo].[client]
WHERE firstname = 'Mary' AND lastname = 'Nelson';
GO

-- Query 6

SELECT [firstname], [lastname], [balance], [city] FROM [dbo].[client]
WHERE [balance] < 200 AND [city] = 'Dunedin';
GO

-- Query 7

SELECT [firstname], [lastname], [creditlimit], [balance], ([creditlimit] - [balance]) AS 'NewBalance'
FROM [dbo].[client];
GO

--	Query 8

SELECT [orderref], [partref], [quantity], [quotedPrice], ([quantity] * [quotedPrice]) AS 'LineTotal'
FROM [dbo].[orderline];
GO

--	Query 9

SELECT [orderref], [orderdate] FROM [dbo].[custorder]
WHERE [orderdate] > '1999-06-01';
GO

-- Query 10

SELECT [city], COUNT([custref]) AS 'Number in each city' FROM [dbo].[client]
GROUP BY [city];
GO

-- Query 11 **

SELECT [RepFirstname], [RepLastName], [balance] AS 'Total Sales Rep Balance' FROM [dbo].[rep] r
INNER JOIN [dbo].[client] c ON r.[repref] = c.[repref];
GO

-- Query 12

SELECT [city], SUM([balance]) AS 'Max Balance' FROM [dbo].[client]
GROUP BY [city];
GO 

-- Query 13

SELECT CONCAT_WS(' ', [firstname], [lastname]) AS 'Client Name', CONCAT_WS(' ', [RepFirstname], [RepLastName]) AS 'Rep Name'
FROM [dbo].[client] c
INNER JOIN [dbo].[rep] r ON r.[repref] = c.[repref];
GO

-- Query 14

SELECT [firstname], [lastname], o.[orderref], o.[orderdate]
FROM [dbo].[client] c
INNER JOIN [dbo].[custorder] o ON o.[custref] = c.[custref];
GO

-- Query 15

SELECT o.[orderref], p.[partref], [description], [onHand] FROM [dbo].[part] p
INNER JOIN [dbo].[orderline] o ON p.[partref] = o.[partref]
WHERE o.[orderref] = 1007;
GO
 
 -- Query 16

 SELECT [orderref], p.[partref], p.[description], [quotedPrice], [quantity] FROM [dbo].[orderline] o
 INNER JOIN [dbo].[part] p ON o.[partref] = p.[partref]
 ORDER BY [description];
 GO

 -- Query 17

 SELECT p.[partref], [description], [quotedPrice], [quantity] FROM [dbo].[orderline] o 
 INNER JOIN [dbo].[part] p ON o.[partref] = p.[partref]
 WHERE [quotedPrice] > 200;
 GO 

 -- Query 18

SELECT [orderref], [orderdate], CONCAT_WS(c.firstname, c.lastname) AS 'Client Name', [description], [unitPrice]
FROM [dbo].[client] c
INNER JOIN [dbo].[part] ON 