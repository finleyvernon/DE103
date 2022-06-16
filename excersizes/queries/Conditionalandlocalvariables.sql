USE [AdventureWorks2017];
GO

-- CONDITIONAL

IF
	(SELECT COUNT(*) FROM [Production].[Product]
	WHERE [Name] LIKE 'Touring-3000%') > 5
	PRINT 'There are more than 5 Touring-3000 bicycles.'
ELSE 
	PRINT 'There are less than 5 Touring-3000 bicycles.';

-- SET LOCAL VARIABLE @NUMBER TO 5, 50, 500 AND TEST
DECLARE @number int;
SET @number = 5 ; -- INITIALISING
IF @number > 100
	PRINT 'The number is large.';
ELSE
	BEGIN
		IF @number < 10
			PRINT 'The number is small.';
		ELSE
			PRINT 'The number is mediium';
	END;

	PRINT @number;
	

