/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.

We don't have to store passwords with Windows logins, the OS will pick up the identity.

*/
USE [master]
GO
CREATE LOGIN 
	[DESKTOP-B83UJAI\Accountant01] 
FROM 
	WINDOWS WITH DEFAULT_DATABASE=[master]
GO
