/*
Author : Martin Catherall
email  : martin@martincatherall.com

IMPORTANT NOTE:
Change any file paths where appropriate.

This can be done through the UI also.
Remember - we can script off through the UI
*/
USE [SECURITY_TEST]
GO

--SELECT * FROM sys.tables AS T;

GRANT SELECT ON dbo.accounts1 TO [DESKTOP-B83UJAI\Accounts];
GRANT SELECT ON dbo.Market01 TO [DESKTOP-B83UJAI\Marketing];
GRANT SELECT ON dbo.Supply01 TO [DESKTOP-B83UJAI\Supply];

DENY SELECT ON dbo.accounts1 TO [DESKTOP-B83UJAI\Marketing];
DENY SELECT ON dbo.Market01 TO [DESKTOP-B83UJAI\Supply];
DENY SELECT ON dbo.Supply01 TO [DESKTOP-B83UJAI\Accounts];


