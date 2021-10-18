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

-- 5 :: Find who is staying in room 101 on 2016-12-03, include first name, last name and address.

SELECT g.first_name AS 'First Name', g.last_name AS 'Last Name', b.room_no AS 'Room Number', g.address AS 'Address',
b.booking_date AS 'Booking Date'
FROM [dbo].[guest] g
INNER JOIN [dbo].[booking] b ON g.id = b.guest_id
WHERE b.booking_date = '2016-12-03' AND b.room_no = 101
GO 