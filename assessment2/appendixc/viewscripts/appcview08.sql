USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO

CREATE OR ALTER VIEW AmountPayableAndrewMurrison AS
	SELECT b.guest_id, g.first_name, g.last_name, SUM(b.nights * r.amount) AS 'Amount Payable' FROM [dbo].[booking] b
	INNER JOIN [dbo].[guest] g ON b.guest_id = g.id
	INNER JOIN [dbo].[rate] r ON b.occupants = r.occupancy AND b.room_type_requested = r.room_type
	WHERE g.first_name = 'Dr Andrew' AND g.last_name = 'Murrison'
	GROUP BY b.guest_id, g.first_name, g.last_name;
	GO

SELECT * FROM AmountPayableAndrewMurrison;
GO

