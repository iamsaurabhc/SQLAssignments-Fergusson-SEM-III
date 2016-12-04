CREATE DATABASE Assignment15
USE Assignment15
GO

CREATE TABLE Car
(
	C_no int PRIMARY KEY,
	C_name varchar(10),
	C_owner Varchar(10)
)

INSERT INTO Car VALUES(1,'Fortuner','Himani')
INSERT INTO Car VALUES(2,'Wagon R','Akshaya')
INSERT INTO Car VALUES(3,'CLA 200','Tanmay')
INSERT INTO Car VALUES(4,'Sail','Priyanka')
INSERT INTO Car VALUES(5,'Q3','Saurabh')
INSERT INTO Car VALUES(6,'320d','Sagar')
INSERT INTO Car VALUES(7,'Esteem','Akshay')

CREATE TABLE Driver
(
	D_no int PRIMARY KEY,
	D_name varchar(10),
	D_addr varchar(10),
	D_city varchar(10)
)

INSERT INTO Driver VALUES(101,'Raju','Camp','Pune')
INSERT INTO Driver VALUES(102,'Anna','Digdoh','Nagpur')
INSERT INTO Driver VALUES(103,'Bhola','Igatpuri','Nashik')
INSERT INTO Driver VALUES(104,'Babu','Bhiwandi','Thane')
INSERT INTO Driver VALUES(105,'Ramesh','Powai','Mumbai')
INSERT INTO Driver VALUES(106,'Kaka','Kopargaon','Nagar')
INSERT INTO Driver VALUES(107,'Ramu','Pandharpur','Solapur')


CREATE TABLE Accident
(
	A_id int PRIMARY KEY,
	Place varchar(25),
	Yr int,
	Ref_C_no int FOREIGN KEY REFERENCES Car(C_no),
	Ref_D_no1 int FOREIGN KEY REFERENCES Driver(D_no),
	CHECK(Yr > 1900)
)

INSERT INTO Accident VALUES(201,'Pune-Nagar Road',1998,1,101)
INSERT INTO Accident VALUES(202,'Pune-Mumbai Road',1999,3,103)
INSERT INTO Accident VALUES(203,'Pune-Nagpur Road',1998,4,105)
INSERT INTO Accident VALUES(204,'Pune-Nashik Road',2001,7,107)
INSERT INTO Accident VALUES(205,'Mumbai-Thane Road',2002,6,102)
INSERT INTO Accident VALUES(206,'Pune-Solapur Road',1998,4,106)
INSERT INTO Accident VALUES(207,'Pune-Nagar Road',2004,3,104)
INSERT INTO Accident VALUES(208,'Pune-Solapur Road',2007,2,104)
INSERT INTO Accident VALUES(209,'Mumbai-Thane Road',2004,1,105)
INSERT INTO Accident VALUES(210,'Pune-Nagar Road',2009,5,103)
INSERT INTO Accident VALUES(211,'Pune-Nashik Road',2010,6,101)

SELECT *
FROM Accident

CREATE TABLE C_D
(
	C_D_no int PRIMARY KEY,
	Ref_C_no int FOREIGN KEY REFERENCES Car(C_no),
	Ref_D_no int FOREIGN KEY REFERENCES Driver(D_no)
)

INSERT INTO C_D VALUES(301,1,102)
INSERT INTO C_D VALUES(302,3,104)
INSERT INTO C_D VALUES(303,5,106)
INSERT INTO C_D VALUES(304,7,101)
INSERT INTO C_D VALUES(305,2,103)
INSERT INTO C_D VALUES(306,4,105)
INSERT INTO C_D VALUES(307,6,107)
INSERT INTO C_D VALUES(308,2,102)
INSERT INTO C_D VALUES(309,4,101)
INSERT INTO C_D VALUES(310,1,103)
INSERT INTO C_D VALUES(311,3,107)


--List all accidents along with their places and cars involved in those accidents that took place in 1998

SELECT C_no,C_name,Place,Yr
FROM Car,Accident
WHERE Ref_C_no=C_no and Yr=1998

--List the drivers in accidents that took place in Pune

SELECT D_no,D_name,Place,Yr
FROM Driver,Accident
WHERE D_no=Ref_D_no1 and Place like '%Pune%'

--Find the place and year of accident that involved Esteem

SELECT Place,Yr
FROM Car,Accident
WHERE C_no=Ref_C_no and C_name='Esteem'

--Display driver  names and owner names which had accident on Pune-nagar road

SELECT D_name,C_owner
FROM Car,Accident,Driver
WHERE C_no=Ref_C_no and D_no=Ref_D_no1
and Place='Pune-Nagar Road'
