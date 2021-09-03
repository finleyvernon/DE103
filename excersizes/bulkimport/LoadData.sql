create database mountainbike1;

use mountainbike1;

-- select * from Club;

create table sponsor
(
sponsorID smallint primary key,
sponsorName varchar(50),
sponsorAddress varchar(200),
sponsorCity varchar(30),
sponsorPhone varchar (15)
);
-- Load external file
load data infile 'H:\\Sponsor.txt'
into table Sponsor
fields terminated by ','
lines terminated by '\n'
(sponsorID, sponsorName,sponsorAddress,sponsorCity,
  sponsorPhone);
  
  select * from Sponsor;
  
  create table club
  (
  clubID smallint primary key,
  clUbName varchar(30)  
  );
insert into club values (1, 'Canterbury United');
insert into club values (2, 'Christchurch United');
insert into club values (3, 'Canterbury Divided');
insert into club values (4, 'Christchurch Divided');
-- Test 
select * from club;
drop table if exists Participant;

create table Participant 
(
participantID char(5) primary key not null,
participant varchar(50),
pAddress varchar(100),
pCity varchar(50),
pPhone varchar(15),
clubID smallint,
FOREIGN KEY (clubID) REFERENCES club(clubID)
);
-- Load another external file
load data infile 'H:\\Participants.csv'
into table Participant
fields terminated by ','
lines terminated by '\n'
(participantID, participant,pAddress,pCity,
  pPhone, clubID);

select * from Participant;









