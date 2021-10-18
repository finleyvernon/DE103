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

-- 11 :: Show the number of guests in the hotel on the night of 2016-11-21. Include all occupants who checked in that day but not those who checked out.

CREATE OR ALTER VIEW [Checkout_date] AS
SELECT b.booking_id, DATEADD(DAY, b.nights, b.booking_date) [checkout]
FROM [dbo].[booking] b;
GO

SELECT SUM(b.occupants) AS 'Occupants' FROM [dbo].[booking] b
INNER JOIN [dbo].[Checkout_date] c ON b.[booking_id] = c.[booking_id]
WHERE b.[booking_date] <= '2016-11-21' AND c.[checkout] > '2016-11-21';
GO