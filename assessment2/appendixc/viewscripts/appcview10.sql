USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW GuestWithEastInAddress AS
	SELECT g.address AS 'Address', g.first_name AS 'First Name', g.last_name AS 'Last Name', ISNULL(b.nights, 0) AS 'Total number of nights'
	FROM [dbo].[booking] b 
	RIGHT JOIN [dbo].[guest] g ON b.guest_id = g.id
	WHERE g.address LIKE ('%East%')
	GROUP BY g.first_name, g.last_name, g.address, b.nights
	GO

SELECT * FROM GuestWithEastInAddress;
GO