use [AdventureWorks2017];
GO

-- Switch on the input/ouput statistics
set statistics io on
go

-- Switch on the time statistics
SET STATISTICS TIME ON
GO

-- Switch on the profile statistics
SET STATISTICS PROFILE ON
GO

-- Switch on the XML statistics
SET STATISTICS XML ON
GO


SELECT * FROM [Person].[Person];

SELECT [FirstName]
FROM [Person].[Person]
WHERE [FirstName] = 'Kim';

select e.LoginID, a.EmailAddress
from  HumanResources.Employee e
 join  Person.Person p
  on e.BusinessEntityID = p.BusinessEntityId
 join Person.EmailAddress a
  on e.BusinessEntityID = a.BusinessEntityID
 where e.BusinessEntityID = 1

 -- New Select statement
 select e.LoginID, e.VacationHours
from  HumanResources.Employee e
 where e.BusinessEntityID = 1

 -- Select the product name from the Production.Product table
-- combine that with the comments and product review ID from 
-- the ProductReview table using the ProductReviewID to 
-- establish the relationship
SELECT p.Name, pr.ProductReviewID, pr.CommentsFROM Production.Product pINNER JOIN Production.ProductReview prON p.ProductID = pr.ProductID;GO

-- We want to see how many different types of people
-- are represented in the Person table.
-- Return all records and all attributes from the 
-- Person table.  This lists the PersonType attribute
-- but how many different types is difficult to see
SELECT *
FROM Person.Person;
GO

-- Ok, then let's only return the PersonType attribute
-- Still too many records to search through
SELECT PersonType
FROM Person.Person;
GO

-- Use the DISTINCT keyword to return only distinct
-- values from the PersonType field
SELECT DISTINCT PersonType
FROM Person.Person;
GO

-- What if we add more fields to the query?
-- Duplicate values will still be returned
SELECT DISTINCT PersonType, EmailPromotion
FROM Person.Person;
GO

-- Using specific fields in the SELECT clause to 
-- filter the attributes to be returned
-- normal query that doesn't use any predicates yet
SELECT LoginID, JobTitle, MaritalStatus 
FROM HumanResources.Employee;
GO

-- Use the WHERE clause to return only the records 
-- in the Employee table where the employees are 
-- married.  This is where we introduce predicates using
-- the WHERE clause to filter rows, not columns
SELECT LoginID, JobTitle, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus  ='M';
GO

-- Use the WHERE clause to return only the records in 
-- the Employee table where the employees are male
SELECT LoginID, JobTitle
FROM HumanResources.Employee
WHERE Gender  ='F';
GO

-- Use the WHERE clause to return only the records in 
-- the Employee table where employees have 99 hours 
-- of vacation time
SELECT *
FROM HumanResources.Employee
WHERE VacationHours = 99;
GO

 -- Switch off the input/ouput statistics
set statistics io OFF
go

-- Switch off the time statistics
SET STATISTICS TIME OFF
GO

-- Switch off the profile statistics
SET STATISTICS PROFILE OFF
GO

-- Switch off the XML statistics
SET STATISTICS XML OFF
GO
