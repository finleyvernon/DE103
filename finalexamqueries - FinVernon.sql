USE [NORTHWND];
GO

-- 2::

SELECT [FirstName], [LastName], [Address], [City], [Region] 
FROM [dbo].[Employees];
GO

-- 3:: 

SELECT [FirstName], [LastName], [Address], [City], [Region], [Country]
FROM [dbo].[Employees]
WHERE [Country] LIKE 'USA';
GO

-- 4:: 

SELECT [FirstName], [LastName], [Address], [City], [Region], [ShipCountry]
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] o ON o.EmployeeID = e.EmployeeID
WHERE [ShipCountry] LIKE 'Belgium';
GO

-- 5::

SELECT [FirstName], [LastName], [City], [HireDate]
FROM [dbo].[Employees]
WHERE [LastName] LIKE 'S%' AND [FirstName] LIKE 'M%';
GO

-- 6:: **

SELECT [FirstName], [LastName], c.[CompanyName], s.[CompanyName]
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] o ON o.EmployeeID = e.EmployeeID
INNER JOIN [dbo].[Customers] c ON c.CustomerID = o.CustomerID
INNER JOIN [dbo].[Shippers] s ON o.CustomerID = o.CustomerID
WHERE s.[CompanyName] LIKE 'Speedy Express' AND e.[City] LIKE 'Bruxelles';
GO

-- 7::

SELECT DISTINCT [Title], [FirstName], [LastName]
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] o ON o.EmployeeID = e.EmployeeID
INNER JOIN [dbo].[Order Details] od ON od.OrderID = o.OrderID
INNER JOIN [dbo].[Products] p ON p.ProductID = od.ProductID
WHERE [ProductName] LIKE 'Gravad Lax' OR [ProductName] LIKE 'Mishi Kobe Niku';
GO

-- 8:: **

SELECT [FirstName], [LastName], [City]

-- 9:: **

SELECT [FirstName], [LastName], [Address], [City], [Region], [BirthDate], DATEDIFF(YY, [BirthDate], GETDATE()) [age]
FROM [dbo].[Employees]
WHERE (SELECT DATEDIFF(YY, [BirthDate], GETDATE()) FROM [dbo].[Employees]) > 60;
GO

-- 10::

SELECT DISTINCT [FirstName], [LastName], [ProductName]
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] o ON o.EmployeeID = e.EmployeeID
INNER JOIN [dbo].[Order Details] od ON od.OrderID = o.OrderID
INNER JOIN [dbo].[Products] p ON p.ProductID = od.ProductID
WHERE [ProductName] LIKE 'Chai';
GO

-- 11:: **

SELECT s.[SupplierID], [CompanyName], [ProductID]
FROM [dbo].[Suppliers] s
INNER JOIN [dbo].[Products] p ON p.SupplierID = s.SupplierID
WHERE [ProductID] > (

);
GO

-- 12:: **

SELECT COUNT([CustomerID]) [Number of customers], [Country]
FROM [dbo].[Customers]
WHERE (SELECT COUNT([CustomerID]) FROM [dbo].[Customers]) > 5
GROUP BY [Country];
GO

-- 13::

-- 14::

SELECT [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], SUM([UnitPrice] * [UnitsInStock]) AS 'Total Value'
FROM [dbo].[Products]
GROUP BY [ProductName], [CategoryID], [UnitPrice], [UnitsInStock]
GO

-- 15::

SELECT [CategoryName], [ProductName], [CompanyName]
FROM [dbo].[Categories] ca
INNER JOIN [dbo].[Products] p ON p.CategoryID = ca.CategoryID
INNER JOIN [dbo].[Suppliers] s ON s.SupplierID = P.SupplierID
WHERE [CategoryName] LIKE 'Condiments';
GO

-- 16::

SELECT [CompanyName], COUNT([OrderID]) [# of Orders Placed]
FROM [dbo].[Customers] c
INNER JOIN [dbo].[Orders] o ON o.CustomerID = c.CustomerID
GROUP BY [CompanyName];
GO

-- 17:: **

SELECT [ProductName], [UnitsOnOrder], [UnitsInStock]
FROM [dbo].[Products]
WHERE (SELECT COUNT([UnitsOnOrder]) FROM [dbo].[Products]) > (SELECT COUNT([UnitsInStock]) FROM [dbo].[Products]);
GO

-- 18::

SELECT [CategoryName], AVG([UnitPrice]) [AVERAGE PRICE]
FROM [dbo].[Categories] c
INNER JOIN [dbo].[Products] p ON p.CategoryID = c.CategoryID
GROUP BY [CategoryName];
GO

-- 19::

SELECT CONCAT_WS('', [FirstName], [LastName]) [Employee Name], [City]
FROM [dbo].[Employees]
WHERE [City] LIKE 'S%' OR [City] LIKE 'T%';
GO