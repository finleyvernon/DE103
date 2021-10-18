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


-- 3 :: List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival.

SELECT CONCAT_WS(' ', g.[first_name], g.[last_name]) AS 'Guest Name', b.arrival_time AS 'Arrival Time',
b.booking_date AS 'Arrival Time'
FROM [dbo].[guest] g
INNER JOIN [dbo].[booking] b ON g.id = b.guest_id
WHERE b.booking_date = '2016-11-05'
ORDER BY b.arrival_time
GO