/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.
*/
USE [SECURITY_TEST];
GO
ALTER ROLE [Accounts] ADD MEMBER [DESKTOP-B83UJAI\Accounts]
GO
ALTER ROLE [Marketing] ADD MEMBER [DESKTOP-B83UJAI\Marketing]
GO
ALTER ROLE [SupplyChain] ADD MEMBER [DESKTOP-B83UJAI\Supply]
GO