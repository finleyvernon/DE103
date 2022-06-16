/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.

In reality you'd have this password in a password safe, maybe you'd have a script to create it and pull the password fom the safe using CMD / Powershell etc

*/
USE [master]
GO
CREATE LOGIN [ARA_User] 
	WITH PASSWORD=N'SomeCr@zyPassw0rd!' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=[master], 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO
