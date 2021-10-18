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

-- 4 :: Give the daily rate that should be paid for bookings with ids 5152, 5165, 5154 and 5295. Include booking id, room type, number of occupants and the amount.

SELECT b.booking_id AS 'Booking ID', r.amount AS 'Daily Rate', b.room_type_requested AS 'Room Type', b.occupants AS 'Number of occupants'
FROM [dbo].[booking] b
INNER JOIN [dbo].[rate] r ON b.occupants = r.occupancy
WHERE b.booking_id IN (5152, 5165, 5154, 5295)
GO