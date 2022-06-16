USE premiere;
GO

-- 1::

SELECT [CustomerNum], [CustomerName], [City] FROM [dbo].[Customer]
ORDER BY [City];
GO

-- 2::

SELECT [CustomerNum], [CustomerName], [City] FROM [dbo].[Customer]
WHERE [City] NOT LIKE 'Grove';
GO

-- 3::

SELECT [CustomerNum], [CustomerName], [Balance] FROM [dbo].[Customer]
WHERE [Balance] BETWEEN 2000 AND 4000;
GO

-- 4:: 

SELECT MAX([Balance]) AS 'Max Cust Balance', MIN([Balance]) AS 'Min Cust Balance', AVG([Balance]) AS 'Average Cust Balance'
FROM [dbo].[Customer];
GO

-- 5::

SELECT [City], MAX([Balance]) AS 'Max Cust Balance', MIN([Balance]) AS 'Min Cust Balance', AVG([Balance]) AS 'Average Cust Balance'
FROM [dbo].[Customer]
GROUP BY [City];
GO

-- 6:: 

SELECT [Warehouse], [PartNum], [Description], [Price] FROM [dbo].[Part]
ORDER BY [Warehouse], [Price] DESC;
GO

-- 7:: 


-- 8:: **

SELECT [PartNum], [Description], [Price]
WHERE [Price] < (
	SELECT AVG([Price]) AS 'Average Price'
	FROM [dbo].[Part]);
GO 

-- 9::

SELECT r.[RepNum], COUNT([CustomerNum]) AS 'Number of customers' FROM [dbo].[Customer] c
INNER JOIN [dbo].[Rep] r ON r.[RepNum] = c.RepNum
GROUP BY r.[RepNum];
GO

-- 10::

SELECT [OrderNum], o.[PartNum], [Description] FROM [dbo].[OrderLine] o
INNER JOIN [dbo].[Part] p ON p.[PartNum] = o.PartNum
WHERE [OrderNum] = 8;
GO

-- 11::

SELECT [OrderNum], o.[PartNum], [Description] FROM [dbo].[OrderLine] o
INNER JOIN [dbo].[Part] p ON p.[PartNum] = o.PartNum
WHERE [Description] LIKE 'Gas Range';
GO

-- 12::

SELECT [CustomerName], CONCAT_WS(' ', [FirstName], [LastName]) AS 'RepName' FROM [dbo].[Customer] c
INNER JOIN [dbo].[Rep] r ON r.[RepNum] = c.RepNum;
GO

-- 13::

SELECT ol.[OrderNum], o.[CustomerNum], [CustomerName] , p.[Description], [NumOrdered], [QuotedPrice] FROM [dbo].[Customer] c
INNER JOIN [dbo].[Orders] o ON o.[CustomerNum] = c.CustomerNum
INNER JOIN [dbo].[OrderLine] ol ON ol.OrderNum = o.OrderNum
INNER JOIN [dbo].[Part] p ON p.[PartNum] = ol.PartNum
ORDER BY c.[CustomerNum];
GO
 
-- 14::

-- 15::

-- 16::

SELECT [CustomerNum], r.[RepNum], r.[FirstName] AS 'RepFirstName', r.[LastName] AS 'RepLastName'
FROM [dbo].[Customer] c
INNER JOIN [dbo].[Rep] r ON r.[RepNum] = c.[RepNum]
WHERE r.FirstName NOT LIKE 'Richard' AND r.LastName NOT LIKE 'Hull';
GO

-- 17::


-- 18::

SELECT [CustomerNum], [CustomerName], [Balance] FROM [dbo].[Customer]
WHERE [Balance] > 2000 AND [Balance] < 3000;
GO

-- 19::



--20::

-- 21::

-- 22::

-- 23 ::

INSERT INTO Customer

VALUES

('Finley Vernon','11B Harrowdale drive','Canterbury','CT','33336',6550.00,7500.00,1);