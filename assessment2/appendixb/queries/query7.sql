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

-- 7 :: Show the total amount payable by guest Ruth Cadbury for her room bookings. You should JOIN to the rate table using room_type_requested and occupants.

SELECT b.guest_id, SUM(b.nights * r.amount) AS 'Amount Payable' FROM [dbo].[booking] b
INNER JOIN [dbo].[guest] g ON b.guest_id = g.id
INNER JOIN [dbo].[rate] r ON b.occupants = r.occupancy AND b.room_type_requested = r.room_type
WHERE g.first_name = 'Ruth' AND g.last_name = 'Cadbury'
GROUP BY b.guest_id;
GO