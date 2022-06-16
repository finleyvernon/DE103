USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW GuestAddresses AS
SELECT CONCAT_WS(' ', [first_name], [last_name]) [Guest Name], [address]
FROM [dbo].[guest];
GO

SELECT * FROM GuestAddresses;
GO




