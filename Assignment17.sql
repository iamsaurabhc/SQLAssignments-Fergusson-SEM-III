CREATE DATABASE Assignment17
USE Assignment17
GO

CREATE TABLE Doctor
(
	D_no int PRIMARY KEY,
	D_name varchar(10),
	Addr varchar(10) NOT NULL,
	City varchar(10)
)

INSERT INTO Doctor VALUES(1,'Dr.Patil','Powai','Mumbai')
INSERT INTO Doctor VALUES(2,'Dr.Oswal','Digdoh','Nagpur')
INSERT INTO Doctor VALUES(3,'Dr.Kanase','Pimpri','Pune')
INSERT INTO Doctor VALUES(4,'Dr.Mehta','Igatpuri','Nashik')
INSERT INTO Doctor VALUES(5,'Dr.Agarwal','Kopargaon','Nagar')
INSERT INTO Doctor VALUES(6,'Dr.Mane','Bhiwandi','Thane')

CREATE TABLE Patient
(
	Opd_no int PRIMARY KEY,
	P_name varchar(20),
	Addr varchar(20),
	Disease varchar(20)
); 

INSERT INTO Patient VALUES(101,'Ramesh','Pune','Cancer')
INSERT INTO Patient VALUES(102,'Vijay','Nshik','Asthama')
INSERT INTO Patient VALUES(103,'Aditya','Nagpur','Cancer')
INSERT INTO Patient VALUES(104,'Ajay','Thane','Tuberclosis')
INSERT INTO Patient VALUES(105,'Aishwarya','Mumbai','Cancer')
INSERT INTO Patient VALUES(106,'Poonam','Pune','Tuberclosis')
INSERT INTO Patient VALUES(107,'Pooja','Nagar','Asthama')
INSERT INTO Patient VALUES(108,'Aditi','Solapur','Asthama')

 
CREATE TABLE D_P
(
	D_P_no int PRIMARY KEY,
	No_visits int,
	Ref_Opd_no int FOREIGN KEY REFERENCES Patient(Opd_no),
	Ref_D_no int FOREIGN KEY REFERENCES Doctor(D_no),
)

INSERT INTO D_P VALUES(11,10,102,1)
INSERT INTO D_P VALUES(12,5,104,1)
INSERT INTO D_P VALUES(13,3,107,5)
INSERT INTO D_P VALUES(14,11,103,2)--
INSERT INTO D_P VALUES(15,12,101,2)--
INSERT INTO D_P VALUES(16,2,106,6)
INSERT INTO D_P VALUES(17,9,105,4)
INSERT INTO D_P VALUES(18,1,108,3)


--Find number of patients visited by Dr.Patil(Dr.Apte)

SELECT COUNT(*)as No_patients,D_name
FROM Doctor,Patient,D_P
WHERE Opd_no=Ref_Opd_no and D_no=Ref_D_no and D_name='Dr.Patil'
GROUP BY D_name

--Find number of patients having Cancer and are visited by Dr.Oswal(Mr.Gandhi) for more than 10 times

SELECT Opd_no,P_name,D_name
FROM Doctor,Patient,D_P
WHERE Opd_no=Ref_Opd_no and D_no=Ref_D_no and D_name='Dr.Oswal' and Disease='Cancer' and No_visits > 10

--Find number of patients suffering from Asthama

SELECT COUNT(Opd_no) as No_patients
FROM Patient,D_P
WHERE Opd_no=Ref_Opd_no and Disease='Asthama'

--List docotrwise patients

SELECT D_name,P_name
FROM Doctor,Patient,D_P
WHERE Opd_no=Ref_Opd_no and D_no=Ref_D_no
GROUP BY D_name,P_name