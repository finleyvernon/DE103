create database ArtGallery;
GO
use ArtGallery;
GO
CREATE TABLE Artist(
artistID int primary key,
firstName varchar(20),
lastName varchar(20),
email varchar(255),
);
delete from [dbo].[Artist];

insert into Artist ( artistID,firstName, lastName, email) values (1, 'Vincent', 'van gogh', 'myemail@email.com'),
(2, 'Vincent', 'Cassel','donotknow@email.com'), (3, 'Mike', 'Lance', 'clever@email.com');

SELECT * FROM Artist;