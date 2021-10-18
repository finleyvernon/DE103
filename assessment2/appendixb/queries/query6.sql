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

-- 6 :: For guests 1185 and 1270 show the number of bookings made and the total number of nights. Your output should include the guest id and the total number of bookings and the total number of nights.

SELECT COUNT(b.booking_id) AS 'Number of bookings', b.guest_id, SUM(b.nights) AS 'Total number of nights'
FROM [dbo].[booking] b
WHERE guest_id IN (1185, 1270)
GROUP BY guest_id;
GO
