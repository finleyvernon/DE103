USE [GuestHouse2020];
GO

-- Creating a new login
CREATE LOGIN appd WITH PASSWORD = 'P@ssword', DEFAULT_DATABASE = [GuestHouse2020];
GO

-- Creating the new user
CREATE USER hired_user FOR LOGIN appd;
GO

-- Creating the role with appropriate permissions
CREATE ROLE invoicing;
GO

-- Add the user to the role
ALTER ROLE invoicing ADD MEMBER hired_user;
GO

-- Give permissions to the user | View 2
GRANT SELECT ON [dbo].[GuestAddresses] TO hired_user;
GO

-- View 8
GRANT SELECT ON [dbo].[AmountPayableAndrewMurrison] TO hired_user;
GO

-- View 9
GRANT SELECT ON [dbo].[AmountPayableSirPrefix] TO hired_user;
GO


-- Testing
EXECUTE AS USER = 'hired_user';
GO

SELECT * FROM [dbo].[GuestAddresses];
SELECT * FROM [dbo].[AmountPayableAndrewMurrison];
SELECT * FROM [dbo].[AmountPayableSirPrefix];
GO

SELECT * FROM [dbo].[booking];
GO

REVERT;
GO

