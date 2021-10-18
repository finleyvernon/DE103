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

-- 1 :: List the people who has booked room number 101 on 17th November 2016.

SELECT CONCAT_WS(' ', g.[first_name], g.[last_name]) AS 'Guest Name', b.room_no AS 'Room Number',
b.booking_date AS 'Date'
FROM [dbo].[guest] g
INNER JOIN [dbo].[booking] b ON g.id = b.guest_id
WHERE b.room_no = 101 AND b.booking_date = '2016-11-17'
GO

-- TEST

SELECT [booking_date], [guest_id], [room_no]
FROM [dbo].[booking]
WHERE [booking_date] = '2016-11-17' AND [room_no] = (101)
GO