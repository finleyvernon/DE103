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

-- 2 :: Give the booking date and the number of nights for guest 1540.

SELECT b.booking_date AS 'Booking Date', b.nights AS 'Number of Nights', b.guest_id AS 'Guest ID'
FROM [dbo].[booking] b
WHERE b.guest_id = 1540
GO 