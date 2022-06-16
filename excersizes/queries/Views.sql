USE [AdventureWorks2017];
GO

-- VIEWS

CREATE VIEW EmpPayRate AS
SELECT HR_E.[BusinessEntityID], [JobTitle], HR_E_PH.[Rate] FROM HumanResources.Employee HR_E
INNER JOIN HumanResources.EmployeePayHistory HR_E_PH ON HR_E.BusinessEntityID = HR_E_PH.BusinessEntityID
GO

-- CREATE OR REPLACE

CREATE OR ALTER VIEW EmpPayRate AS
SELECT HR_E.[BusinessEntityID], [JobTitle], HR_E_PH.[Rate]
FROM HumanResources.Employee HR_E
INNER JOIN HumanResources.EmployeePayHistory HR_E_PH ON HR_E.BusinessEntityID = HR_E_PH.BusinessEntityID
GO

CREATE OR ALTER VIEW EmpPayRate AS
SELECT [HumanResources].Employee, JobTitle, [Rate], [Name]
FROM HumanResources.Employee INNER JOIN [HumanResources].EmployeePayHistory
ON HumanResources
go


-- Pathetic Query
CREATE OR ALTER VIEW EmpPayRateDeptName AS
SELECT [JobTitle], [Rate], [Name]
FROM [HumanResources].


-- Alternate Query
CREATE OR ALTER VIEW EmpPayRateDeptName AS
SELECT [JobTitle], HR_E_PH.[Rate], HR_D.[Name]
FROM [HumanResources].[Employee] HR_E
, [HumanResources].[EmployeePayHistory] HR_E_PH
, [HumanResources].[EmployeeDepartmentHistory] HR_EDH
, [HumanResources].Department HR_D
WHERE HR_E.[BusinessEntityID] = HR_E_PH.[BusinessEntityID]
AND HR_E_PH.[BusinessEntityID] = HR_EDH.[BusinessEntityID]
AND HR_EDH.[DepartmentID] = HR_D.[DepartmentID]
GO

SELECT * FROM EmpPayRateDeptName
WHERE NAME = 'ENGINEERING'; -- Regex Search 
GO


CREATE VIEW EmpPayRate2 AS -- Alternate
SELECT HR_E.[BusinessEntityID], [JobTitle], 

-- CALL A VIEW

SELECT * FROM EmpPayRate;
GO

-- DROP VIEW
DROP VIEW EmpPayRate;
GO


/*
AUTHOR: FIN VERNON
DATE CREATED: 29/09/2021
ATTRIBUTES FROM 4 DIFFERENT TABLES
EMPLOYEE : [BusinessEntityID], JOBTITLE
EMPLOYEEPLAYHISTORY : [Rate]
[EmployeeDepartmentHistory] : <CONNECTION>
[Department]:[Name]
*/