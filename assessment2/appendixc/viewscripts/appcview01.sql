USE [GuestHouse2020];
GO

SET STATISTICS IO ON;
GO
SET STATISTICS TIME ON;
GO


CREATE VIEW RoomDescription AS
SELECT [id], [description] FROM [dbo].[room_type];
GO

SELECT * FROM RoomDescription;
GO




