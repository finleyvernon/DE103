USE [GuestHouse2020];
GO

-- Statistics
-- Switch on the input/ouput statistics
SET STATISTICS IO ON
GO
-- Switch off the input/output statistics
SET STATISTICS IO OFF
GO
-- Switch on the time statistics
SET STATISTICS TIME ON
GO
-- Switch off the time statistics
SET STATISTICS TIME OFF
GO

-- 8 :: Calculate the total bill for booking 5346 including extras.

SELECT b.booking_id AS 'Booking ID', SUM(e.amount) AS 'Total for extras', (r.amount * b.nights) AS 'Room Total',
	(SUM(e.amount) + (r.amount * b.nights)) AS 'Bill'
FROM [dbo].[booking] b
INNER JOIN [dbo].[rate] r ON b.occupants = r.occupancy AND b.room_type_requested = r.room_type
INNER JOIN [dbo].[extra] e ON b.booking_id = e.booking_id
WHERE b.booking_id = 5346
GROUP BY b.booking_id, b.nights, r.amount
GO