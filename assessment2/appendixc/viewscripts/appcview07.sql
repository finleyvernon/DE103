USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW TotalBillBooking5128 AS
	SELECT b.booking_id, SUM(e.amount) AS 'Total for extras', (r.amount * b.nights) AS 'Room Total',
	(SUM(e.amount) + (r.amount * b.nights)) AS 'Bill'
	FROM [dbo].[booking] b
	INNER JOIN [dbo].[rate] r ON b.occupants = r.occupancy AND b.room_type_requested = r.room_type
	INNER JOIN [dbo].[extra] e ON b.booking_id = e.booking_id
	WHERE b.booking_id = 5128
	GROUP BY b.booking_id, b.nights, r.amount
	GO

SELECT * FROM TotalBillBooking5128;
GO