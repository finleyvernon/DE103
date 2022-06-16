USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW GuestRoom26thNov2016 AS
	SELECT [id], [first_name], [last_name], [room_no], [booking_date]
	FROM [dbo].[guest] g
	INNER JOIN [dbo].[booking] b ON b.guest_id = g.id
	WHERE [booking_date] = '2016-11-26';
GO

SELECT * FROM GuestRoom26thNov2016;
GO









