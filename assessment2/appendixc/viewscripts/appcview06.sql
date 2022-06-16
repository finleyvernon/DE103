USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO


CREATE OR ALTER VIEW GuestStayBooking5046 AS
	SELECT b.[booking_id], CONCAT_WS(' ', g.[first_name], g.[last_name]) [guestname], b.[booking_date] [checkin],
	DATEADD(DAY, b.nights, b.booking_date) [checkout], b.[nights]
	FROM [dbo].[booking] b
	INNER JOIN [dbo].[guest] g ON g.[id] = b.guest_id
	WHERE [booking_id] = 5046;
	GO

SELECT * FROM GuestStayBooking5046;
GO
