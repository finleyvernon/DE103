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

-- 9 :: For every guest who has the word “Edinburgh” in their address show the total number of nights booked. Be sure to include 0 for those guests who have never had a booking. Show last name, first name, address and number of nights. Order by last name then first name.

SELECT g.address AS 'Address', g.first_name AS 'First Name', g.last_name AS 'Last Name', ISNULL(b.nights, 0) AS 'Total number of nights'
FROM 
[dbo].[booking] b RIGHT JOIN [dbo].[guest] 
g ON b.guest_id = g.id
WHERE g.address LIKE ('%Edinburgh%')
GROUP BY g.first_name, g.last_name, g.address, b.nights
GO