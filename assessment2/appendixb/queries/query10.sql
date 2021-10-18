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

-- 10 :: For each day of the week beginning 2016-11-25 show the number of bookings starting that day. Be sure to show all the days of the week in the correct order.

SELECT DATENAME(WEEKDAY, booking_date) AS 'Day of the week', COUNT(b.booking_id) AS 'Number of bookings'
FROM [dbo].[booking] b
WHERE booking_date BETWEEN '2016-11-25' AND '2016-12-01'
GROUP BY booking_date
GO