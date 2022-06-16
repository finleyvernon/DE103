/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.

Control Panel | All Control Panel Items | Administrative Tools | Computer Management
Then "Local Groups and Users" | "Groups" -> right click "Add New"

Create three windows groups
Accounts
Supply
Marketing

"Local Groups and Users" | "Usesr" -> right click "Add New"

Create a number of windows users and add the to "Account"   windows group
Create a number of windows users and add the to "Supply"    windows group
Create a number of windows users and add the to "Marketing" windows group

These scripts are meant to demonstrate using role based security using windows groups and SQL Roles.

*/
USE tempdb;
GO
/*
Drop the test database we will use
*/
IF EXISTS(SELECT * FROM sys.databases AS dbs WHERE dbs.[name] = 'SECURITY_TEST')
	BEGIN
		DROP DATABASE SECURITY_TEST;
	END
GO
/*
Drop all logins that will be used from the SQL Instance.
These will be set up again by other scripts
*/
IF EXISTS(SELECT * FROM sys.server_principals AS sp WHERE sp.[name] = 'DESKTOP-B83UJAI\Accounts')
BEGIN
	DROP LOGIN [DESKTOP-B83UJAI\Accounts];
END;

IF EXISTS(SELECT * FROM sys.server_principals AS sp WHERE sp.[name] = 'DESKTOP-B83UJAI\Marketing')
BEGIN
	DROP LOGIN [DESKTOP-B83UJAI\Marketing];
END;

IF EXISTS(SELECT * FROM sys.server_principals AS sp WHERE sp.[name] = 'DESKTOP-B83UJAI\Supply')
BEGIN
	DROP LOGIN [DESKTOP-B83UJAI\Supply];
END;
IF EXISTS(SELECT * FROM sys.server_principals AS sp WHERE sp.[name] = 'ARA_User')
BEGIN
	DROP LOGIN [ARA_User];
END;
IF EXISTS(SELECT * FROM sys.server_principals AS sp WHERE sp.[name] = 'DESKTOP-B83UJAI\Accountant01')
BEGIN
	DROP LOGIN [DESKTOP-B83UJAI\Accountant01];
END;
GO
CREATE DATABASE SECURITY_TEST;
GO
USE SECURITY_TEST;
GO
CREATE TABLE dbo.accounts1
(
	col1 INT
);
CREATE TABLE dbo.accounts2
(
	col1 INT
);
CREATE TABLE dbo.accounts3
(
	col1 INT
);
-----------------------------------------
CREATE TABLE dbo.Market01
(
	col1 INT
);
CREATE TABLE dbo.Market02
(
	col1 INT
);
CREATE TABLE dbo.Market03
(
	col1 INT
);
-----------------------------------------
CREATE TABLE dbo.Supply01
(
	col1 INT
);
CREATE TABLE dbo.Supply02
(
	col1 INT
);
CREATE TABLE dbo.Supply03
(
	col1 INT
);