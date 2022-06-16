USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE or ALTER VIEW CheckInOutfor5204 AS
	SELECT [booking_id], [booking_date] [checkin], DATEADD(DAY, b.nights, b.booking_date) [checkout], [nights]
	FROM [dbo].[booking] b
	WHERE [booking_id] = 5204;
GO

SELECT * FROM CheckInOutfor5204;
GO
























