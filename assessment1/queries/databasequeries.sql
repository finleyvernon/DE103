CREATE DATABASE HospitalSystem;
GO
USE HospitalSystem;
GO

-- Create tables without foreign keys first because of least dependencies

CREATE TABLE Department (
	departmentID char(6) PRIMARY KEY,
	departmentName varchar(50) UNIQUE
);
GO


CREATE TABLE Patient (
	NHI char(7) PRIMARY KEY,
	firstName varchar(50),
	lastName varchar(50),
	DOB date,
	gender varchar(6),
	healthTargetEligible varchar(3),
);
GO

CREATE TABLE Profession (
	professionID char(6) PRIMARY KEY,
	professionName varchar(20) NOT NULL UNIQUE,
);
GO

-- Create tables with foreign keys

CREATE TABLE Referree (
	referreeID char(6) PRIMARY KEY,
	firstName varchar(50),
	lastName varchar(50),
	professionID char(6) FOREIGN KEY REFERENCES Profession(professionID),
);
GO

CREATE TABLE Surgeon (
	surgeonID char(6) PRIMARY KEY,
	departmentID char(6) FOREIGN KEY REFERENCES Department(departmentID),
	firstName varchar(50),
	lastName varchar(50)
);
GO

CREATE TABLE Referral (
	referralID varchar(8) PRIMARY KEY,
	NHI char(7) FOREIGN KEY REFERENCES Patient(NHI),
	surgeonID char(6) FOREIGN KEY REFERENCES Surgeon(surgeonID),
	referreeID char(6) FOREIGN KEY REFERENCES Referree(referreeID),
	DOB date,
	referralDate date,
	waitlistDate date,
	ageAtReferral int
);
GO

CREATE TABLE Appointment (
	appointmentID varchar(8) PRIMARY KEY,
	NHI char(7) FOREIGN KEY REFERENCES Patient(NHI),
	surgeonID char(6) FOREIGN KEY REFERENCES Surgeon(surgeonID),
	FSADate date NULL,
	referralDate date,
	daysWaitingFromReferral int NULL
);
GO

-- Drop tables below incase

DROP TABLE Patient
DROP TABLE Department
DROP TABLE Profession
DROP TABLE Referree
DROP TABLE Surgeon
DROP TABLE Referral
DROP TABLE Appointment


-- Local machine path: C:\Users\finle\Documents\DE103\assessment1\.csvfiles

-- Insert data from department csv file into department table
BULK INSERT Department FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\departmentTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Department;
DELETE FROM Department;

-- Insert data from patient csv file into patient table
BULK INSERT Patient FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\patientTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Patient;
DELETE FROM Patient;

-- Insert data from profession csv file into profession table
BULK INSERT Profession FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\professionTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Profession;
DELETE FROM Profession;


-- Insert data from referree csv file into referree table
BULK INSERT Referree FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\referreeTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Referree;
DELETE FROM Referree;

-- Insert data from surgeon csv file into surgeon table
BULK INSERT Surgeon FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\surgeonTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Surgeon;
DELETE FROM Surgeon;

-- Insert data from referral csv file into referral table
BULK INSERT Referral FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\referralTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Referral;
DELETE FROM Referral;

-- Insert data from appointment csv file into appointment table
BULK INSERT Appointment FROM 'C:\Users\finle\Documents\DE103\assessment1\.csvfiles\appointmentTable.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR=',', ROWTERMINATOR='\n');
GO
-- SELECT * FROM Appointment;
DELETE FROM Appointment;



-- Query Questions:

-- Q1: How many people have been referred to cardiothorcic?
SELECT referralID, NHI, surgeonID, referreeID, DOB, referralDate, waitlistDate, ageAtReferral FROM Referral
WHERE Referral.surgeonID = 'SG3485' OR Referral.surgeonID = 'SG3486' OR Referral.surgeonID = 'SG3494';

-- Q2: What is the average time taken (in days) to see a surgeon by department?
SELECT d.departmentName AS department_name, AVG(DATEDIFF(DAY, r.waitlistDate, a.FSADate)) AS average_waiting_time FROM Department d
INNER JOIN Surgeon s ON s.departmentID = d.departmentID
INNER JOIN Appointment a ON a.surgeonID = s.surgeonID
INNER JOIN Referral r ON r.surgeonID = s.surgeonID
GROUP BY d.departmentName;

-- Q3: Who has each Surgeon had on their list and how long have they been waiting or did they wait?
SELECT r.surgeonID AS SurgeonID, r.NHI AS PatientNHI, DATEDIFF(DAY, r.waitlistDate, a.FSADate) AS Waiting_Time FROM Referral r
INNER JOIN Appointment a ON a.NHI = r.NHI
ORDER BY surgeonID;

-- Q4: Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned?
SELECT Patient.NHI AS PatientNHI, Patient.DOB AS Date_Of_Birth, DATEDIFF(YEAR, Patient.DOB, GETDATE()) AS Current_Age, Department.departmentName FROM Referral
INNER JOIN Patient ON Referral.NHI = Patient.NHI
INNER JOIN Surgeon ON Referral.surgeonID = Surgeon.surgeonID
INNER JOIN Department ON Surgeon.surgeonID = Department.departmentID
WHERE (NOT Department.departmentID = 'DP2875' AND DATEDIFF(YEAR, Patient.dob, GETDATE()) < 18) OR (Department.departmentID = 'DP2875' AND DATEDIFF(YEAR, Patient.DOB, GETDATE()) >= 18);

-- Q5: What percentage of patient were seen within the target of 75 days by department?
SELECT (COUNT(r.NHI) * 100 / (SELECT COUNT(*) FROM Referral)) as Percentage_Of_Patients_Seen_In_75_Days FROM Referral r
INNER JOIN Patient p ON r.NHI = p.NHI
INNER JOIN Appointment a ON r.NHI = a.NHI
WHERE DATEDIFF(DAY, r.waitlistDate, a.FSADate) < 76