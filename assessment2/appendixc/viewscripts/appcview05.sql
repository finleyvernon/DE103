USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW MadeBooking209Nov2016 AS
	SELECT [id], [first_name], [last_name], [room_no], [booking_date]
	FROM [dbo].[booking] b 
	INNER JOIN [dbo].[guest] g ON g.[id] = b.guest_id
	WHERE b.[booking_date] = '2016-11-26' AND b.room_no = 209;
	GO


SELECT * FROM MadeBooking209Nov2016;
GO