/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.
*/
USE [master]
GO
/*
Already created the groups in Windows (ideally domain groups)
*/
CREATE LOGIN 
	[DESKTOP-B83UJAI\Accounts] 
FROM 
	WINDOWS WITH DEFAULT_DATABASE=[master]
GO

USE [master]
GO
CREATE LOGIN 
	[DESKTOP-B83UJAI\Marketing] 
FROM 
	WINDOWS WITH DEFAULT_DATABASE=[master]
GO

USE [master]
GO
CREATE LOGIN 
	[DESKTOP-B83UJAI\Supply] 
FROM 
	WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/*
Add groups to the database
*/
USE [SECURITY_TEST];
GO
CREATE USER [DESKTOP-B83UJAI\Accounts]   FROM LOGIN [DESKTOP-B83UJAI\Accounts] ;
CREATE USER [DESKTOP-B83UJAI\Marketing]  FROM LOGIN [DESKTOP-B83UJAI\Marketing]  ;
CREATE USER [DESKTOP-B83UJAI\Supply]     FROM LOGIN [DESKTOP-B83UJAI\Supply] ;
