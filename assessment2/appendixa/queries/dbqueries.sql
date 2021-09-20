USE GuestHousesfiv0027;
GO

-- 1 , Total number of bookings

SELECT COUNT([booking_id]) AS 'Booking Count' FROM [dbo].[booking];
GO

-- 2 , Total number of guests booked

SELECT SUM([occupants]) AS 'Total number of guests'
FROM [dbo].[booking];
GO

-- 3 , List of guests by room type

SELECT b.booking_id AS 'Booking ID', CONCAT_WS(' ', g.first_name, g.last_name) AS 'Guest Name',
	b.[room_type_requested] AS 'Room Type' FROM [booking] b
INNER JOIN [dbo].[guest] g ON b.guest_id = g.id
ORDER BY room_type_requested;
GO