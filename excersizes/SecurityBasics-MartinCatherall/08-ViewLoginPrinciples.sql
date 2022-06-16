USE tempdb;
GO
/*
Examine sids
*/
SELECT * FROM sys.server_principals AS dps;

USE SECURITY_TEST;
GO
SELECT * FROM sys.database_principals AS dps;

/*
Notice the Type of login - G 
*/
SELECT 
	 [LoginName] = SUSER_SNAME(sp.[sid]) --Can get the name like this also
	,* 
FROM sys.server_principals AS sp
JOIN
	sys.database_principals AS dp on dp.[sid] = sp.[sid]
ORDER BY
	dp.[name];
GO