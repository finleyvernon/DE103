CREATE DATABASE MAGAZINEANSWER;
GO
USE MAGAZINEANSWER;
GO


Drop table Subscription;
Drop table MagCategory;
Drop table Article;
Drop table Magazine;
Drop table Subscriber;
Drop table Publisher;
Drop table Invoice;
Drop table Category;


Create table Category
(
CategoryCode	Char(2) primary key,
Category	Varchar(20)
);

Insert into  Category Values('E1', 'Entertainment');
Insert into  Category Values('G1', 'Gardening');
Insert into  Category Values('G2', 'Gossip');
Insert into  Category Values('H1', 'Health');
Insert into  Category Values('H2', 'Home');
Insert into  Category Values('L1', 'Lifestyle');
Insert into  Category Values('T1', 'Television');

SELECT * FROM Category;
SELECT * FROM Invoice;
SELECT * FROM Publisher;
SELECT * FROM Subscriber;
SELECT * FROM Category;
SELECT * FROM Category;
SELECT * FROM Category;


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

Create table Subscriber
(
SubscriberNo	Integer primary key,
FirstName	Varchar(20),
LastName	Varchar(20),
Street		Varchar(30),
City		Varchar(20),
PostalCode	Char(4)
);

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

Create table Article
(
ArticleNo	Integer primary key,
MagazineID	Char(6),
Title		Varchar(50),
AuthorLName	Varchar(20),
AuthorFName	Varchar(20),
DateSubmitted	Date,
foreign key (MagazineID) references magazine (MagazineID)
);

Insert into  Article Values(21000, 'GAR100', 'The hip side of roses', 'Lea Taylor', 'Barbara', '9-Apr-09');
Insert into  Article Values(21001, 'GAR100', 'Lend me your pears', 'Cameron', 'Sally', '2-Apr-09');
Insert into  Article Values(21002, 'TTV100', 'Freeze - it’s the ice queen', 'Sharp', 'Keith', '25-Apr-09');
Insert into  Article Values(21003, 'TTV100', 'Hardy folk', 'Power', 'Vicki', '20-Apr-09');
Insert into  Article Values(21004, 'ALF100', 'Walls', 'Thodey', 'Rose', '20-Feb-09');
Insert into  Article Values(21005, 'ALF100', 'Seven hours a day', 'Tollemache', 'Althea', '9-Feb-09');
Insert into  Article Values(21006, 'YHG100', 'Colour chic', 'Stephenson', 'Sharon', '14-Mar-09');
Insert into  Article Values(21007, 'YHG100', 'Cosy Cottage', 'Stanford', 'Josie', '19-Mar-09');
Insert into  Article Values(21008, 'NWH100', 'Your perfect weight - get there, stay there', 'Upton', 'Julie', '9-Jan-09');
Insert into  Article Values(21009, 'NWH100', 'Strike a pose', 'Greenfield', 'Paige', '22-Jan-09');
Insert into  Article Values(21010, 'OK100', 'Salon Sisters', 'Bhasan', 'Nicholas', '13-Mar-09');
Insert into  Article Values(21011, 'OK100', 'A Familys Heartache', 'Ormes', 'Brooke', '15-Mar-09');

Create table MagCategory
(
MagazineID	Char(6),
CategoryCode	Char(2),
primary key (MagazineID, CategoryCode),
foreign key (MagazineID) references Magazine (MagazineID),
foreign key (CategoryCode) references Category (CategoryCode)
);

Insert into  MagCategory Values ('ALF100', 'G1');
Insert into  MagCategory Values ('ALF100', 'H2');
Insert into  MagCategory Values ('GAR100', 'G1');
Insert into  MagCategory Values ('NWH100', 'H1');
Insert into  MagCategory Values ('NWH100', 'L1');
Insert into  MagCategory Values ('OK100', 'E1');
Insert into  MagCategory Values ('OK100', 'G2');                                                                                    
Insert into  MagCategory Values ('TTV100', 'E1');
Insert into  MagCategory Values ('TTV100', 'T1');
Insert into  MagCategory Values ('YHG100', 'G1');
Insert into  MagCategory Values ('YHG100', 'H2');


Create table Subscription
(
SubscriptionNo	SmallInt primary key,
SubscriberNo	Integer,
MagazineID	Char(6),
ExpiryDate	Date,
InvoiceNo	Integer,
foreign key (SubscriberNo) references Subscriber (SubscriberNo),
Foreign key (MagazineID) references Magazine (MagazineID),
foreign key (InvoiceNo) references Invoice (InvoiceNo)
);

Insert into  Subscription Values (101, 6000, 'GAR100', '28-Feb-10', 3500);
Insert into  Subscription Values (102, 6000, 'TTV100', '28-Feb-10', 3500);
Insert into  Subscription Values (103, 6008, 'NWH100', '28-Feb-10', 3501);
Insert into  Subscription Values (104, 6003, 'TTV100', '28-Feb-10', 3502);
Insert into  Subscription Values (105, 6006, 'OK100', '28-Feb-10', 3503);
Insert into  Subscription Values (106, 6004, 'TTV100', '31-Mar-10', 3504);
Insert into  Subscription Values (107, 6004, 'ALF100', '31-Mar-10', 3504);
Insert into  Subscription Values (108, 6006, 'TTV100', '31-Mar-10', 3505);
Insert into  Subscription Values (109, 6008, 'YHG100', '31-Mar-10', 3506);
Insert into  Subscription Values (110, 6008, 'GAR100', '31-Mar-10', 3506);
Insert into  Subscription Values (111, 6002, 'NWH100', '30-Apr-10', 3507);
Insert into  Subscription Values (112, 6005, 'YHG100', '30-Apr-10', 3508);
Insert into  Subscription Values (113, 6007, 'GAR100', '30-Apr-10', 3509);
Insert into  Subscription Values (114, 6007, 'OK100', '30-Apr-10', 3509);

