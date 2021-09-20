-- Creation of Hotel Database
CREATE DATABASE GuestHousesfiv0027;
GO
USE GuestHousesfiv0027;
GO

-- Create tables with no dependencies first

CREATE TABLE calender (
	i date PRIMARY KEY,
);
GO

CREATE TABLE guest (
	id char(4) PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	guest_address varchar(50)
);
GO

CREATE TABLE room_type (
	id varchar(6) PRIMARY KEY,
	room_description varchar(50)
);
GO

CREATE TABLE rate (
	room_type varchar(6) FOREIGN KEY REFERENCES room_type(id),
	occupancy tinyint,
	amount decimal(6,2),
	PRIMARY KEY(room_type, occupancy)
);
GO

CREATE TABLE room (
	id char(3) PRIMARY KEY,
	room_type varchar(6) FOREIGN KEY REFERENCES room_type(id),
	max_occupancy tinyint
);
GO

CREATE TABLE booking (
	booking_id char(4) PRIMARY KEY,
	booking_date date,
	room_no char(3),
	guest_id char(4),
	occupants tinyint,
	room_type_requested varchar(6),
	FOREIGN KEY (room_type_requested, occupants) REFERENCES rate([room_type], [occupancy]),
	FOREIGN KEY (guest_id) REFERENCES guest([id]),
	FOREIGN KEY (room_no) REFERENCES room([id]),
	nights char(1),
	arrival_time time
);
GO
-- FK (FK1, FK2) reference table (PK1, PK2)

CREATE TABLE extra (
	extra_id char(6) PRIMARY KEY,
	booking_id char(4) FOREIGN KEY REFERENCES booking(booking_id),
	extra_description varchar(50),
	amount decimal(6,2)
);
GO

-- Deleting tables if need

DROP TABLE guest;
DROP TABLE room_type;
DROP TABLE rate;
DROP TABLE room;
DROP TABLE booking;
DROP TABLE extra;
GO

-- Bulk Insert Data

BULK INSERT calender FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\calendar.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM calender;

BULK INSERT guest FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\guest.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM guest; 

BULK INSERT room_type FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\room_type.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM room_type;

BULK INSERT rate FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\rate.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM rate;

BULK INSERT room FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\room.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM room;

BULK INSERT booking FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\booking.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM booking;

BULK INSERT extra FROM 'C:\Users\finle\Documents\DE103\assessment2\datafiles\extra.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO

SELECT * FROM extra;
