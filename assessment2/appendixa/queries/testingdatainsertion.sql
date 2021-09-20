USE GuestHousesfiv0027;
GO

-- Testing inserted data

-- Testing count of rows for guest table is the same as the data file (minus one row for the headings)

SELECT COUNT([id]) AS 'Number of guest rows' FROM [dbo].[guest];
GO

-- Testing count of rows for calendar table is the same as the data file

SELECT COUNT([i]) AS 'Number of calendar rows' FROM [dbo].[calender];
GO

-- Testing count of rows for room_type table is the same as the data file

SELECT COUNT([id]) AS 'Number of room_type rows' FROM [dbo].[room_type];
GO

-- Testing count of rows for rate table is the same as the data file

SELECT COUNT([amount]) AS 'Number of rate rows' FROM [dbo].[rate];
GO

-- Testing count of rows for room table is the same as the data file

SELECT COUNT([id]) AS 'Number of room rows' FROM [dbo].[room];
GO

-- Testing count of rows for booking table is the same as the data file

SELECT COUNT([booking_id]) AS 'Number of booking rows' FROM [dbo].[booking];
GO

-- Testing count of rows for extra table is the same as the data file

SELECT COUNT([extra_id]) AS 'Number of extra rows' FROM [dbo].[extra];
GO