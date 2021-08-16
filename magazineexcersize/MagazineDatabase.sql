-- Create the database
CREATE DATABASE MagazineEX;
GO
USE MagazineEX;
GO


-- Drop table Subscription;
-- Drop table MagCategory;
-- Drop table Article;
-- Drop table Magazine;
-- Drop table Subscriber;
-- Drop table Publisher;
-- Drop table Invoice;
-- Drop table Category;


-- Create the Category table
CREATE TABLE Category(
categoryCode CHAR(2) PRIMARY KEY NOT NULL,
categoryDesc VARCHAR(25) NOT NULL,
);

-- Insert into the category table
Insert into  Category Values('E1', 'Entertainment');
Insert into  Category Values('G1', 'Gardening');
Insert into  Category Values('G2', 'Gossip');
Insert into  Category Values('H1', 'Health');
Insert into  Category Values('H2', 'Home');
Insert into  Category Values('L1', 'Lifestyle');
Insert into  Category Values('T1', 'Television');

Create table Invoice
(
InvoiceNo	Integer primary key,
InvoiceDate	Date,
Paid		Varchar(3)
);

Insert into  Invoice Values (3500, '20-Feb-09', 'Yes');
Insert into  Invoice Values (3501, '22-Feb-09', 'Yes');
Insert into  Invoice Values (3502, '19-Feb-09', 'Yes');
Insert into  Invoice Values (3503, '28-Feb-09', 'Yes');
Insert into  Invoice Values (3504, '30-Mar-09', 'No');
Insert into  Invoice Values (3505, '30-Mar-09', 'Yes');
Insert into  Invoice Values (3506, '30-Mar-09', 'No');
Insert into  Invoice Values (3507, '15-Apr-09', 'Yes');
Insert into  Invoice Values (3508, '21-Apr-09', 'No');
Insert into  Invoice Values (3509, '28-Apr-09', 'Yes');


-- Test tables
SELECT * FROM Category;
SELECT * FROM Invoice;
SELECT * FROM Publisher;
SELECT * FROM Subscriber;
SELECT * FROM Magazine;



Create table Publisher
(
PublisherID	Integer primary key,
PublisherName	Varchar(45),
Address1	Varchar(35),
Address2	Varchar(30),
City		Varchar(20),
PostCode	Char(4),
Country		Varchar(15)
);


Insert into  Publisher Values (1000, 'Fairfax NZ Ltd','Fairfax NZ House', '110 Customs Street', 'Auckland', '1010', 'NZ');
Insert into  Publisher Values (2000, 'Northern and Shell Pacific Ltd', '2 New McLean St', 'Edgecliff', 'NSW', '2027', 'Australia');
Insert into  Publisher Values (3000, 'ACP Magazines', 'Cnr Fanshawe and Beaumont Streets', 'Westhaven', 'Auckland', '1010', 'NZ');
Insert into  Publisher Values (4000, 'Lifestyle Publishing', 'PO Box 14-109', 'Panmure', 'Auckland', '1050', 'NZ');
Insert into  Publisher Values (5000, 'Pacific Magazines', '23 Union Street', 'Central City','Auckland', '1010', 'NZ');

-- Create the subscriber table
Create table Subscriber
(
SubscriberNo	Integer primary key,
FirstName	Varchar(20),
LastName	Varchar(20),
Street		Varchar(30),
City		Varchar(20),
PostalCode	Char(4)
);

-- Insert into the subscriber table
Insert into  Subscriber Values (6000, 'Joanne', 'MacFadden', '12 Frankleigh Street', 'Auckland', '1060');
Insert into  Subscriber Values (6002, 'Diane', 'Scott', '28 Blakes Road', 'Christchurch', '8051');
Insert into  Subscriber Values (6003, 'Michael', 'Frame', '251 Greers Road', 'Christchurch', '8041');
Insert into  Subscriber Values (6004, 'Nigel', 'Marshall', '19 Swift Terrace', 'Wellington', '6011');
Insert into  Subscriber Values (6005, 'Wendy', 'Yates', '25 Shakespeare Road', 'Christchurch', '8023');
Insert into  Subscriber Values (6006, 'Jessie', 'Knott', '2 Willow Lane', 'Christchurch', '8011');
Insert into  Subscriber Values (6007, 'Anthea', 'Scurr', '6 Cookson Street', 'Dunedin', '9012');
Insert into  Subscriber Values (6008, 'Christine', 'Elder', '156 White Street', 'Auckland', '1010');


Create table Magazine
(
MagazineID	Char(6) primary key,
Title		Varchar(30),
FrequencyCode	Varchar(15),
YearlyCost	Decimal(6,2),
PublisherID	Integer,
foreign key (publisherid) references Publisher (publisherid)
);

Insert into  Magazine Values ('ALF100', 'Alfresco', 'Bi-monthly', 37.50, 4000);
Insert into  Magazine Values ('GAR100', 'New Zealand Gardener', 'Monthly', 50.00, 1000);
Insert into  Magazine Values ('NWH100', 'New Zealand Womens Health', 'Monthly', 59.95, 5000);
Insert into  Magazine Values ('OK100', 'OK!', 'Weekly', 155.60, 2000);
Insert into  Magazine Values ('TTV100', 'The TV Guide', 'Weekly', 65.00, 1000);
Insert into  Magazine Values ('YHG100', 'Your Home and Garden', 'Monthly', 54.95, 3000);