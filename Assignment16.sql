CREATE DATABASE Assignment16
USE Assignment16
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

CREATE TABLE Hospital
(
	H_no int PRIMARY KEY,
	H_name varchar(30),
	Street varchar(10),
	H_city varchar(10)
)

INSERT INTO Hospital VALUES(101,'Apollo Hospital','MG Road','Pune')
INSERT INTO Hospital VALUES(102,'Sterling Hospital','BP Road','Nashik')
INSERT INTO Hospital VALUES(103,'Aditya Birla Hospital','SB Road','Nagpur')
INSERT INTO Hospital VALUES(104,'Sahayadri Hospital','KR Road','Thane')
INSERT INTO Hospital VALUES(105,'Star Hospital','SP Road','Mumbai')
INSERT INTO Hospital VALUES(106,'D.Mangeshkar Hospital','YS Road','Nagar')


CREATE TABLE D_H
(
	D_H_no int PRIMARY KEY,
	Ref_D_no int FOREIGN KEY REFERENCES Doctor(D_no),
	Ref_H_no int FOREIGN KEY REFERENCES Hospital(H_no)
)

INSERT INTO D_H VALUES(201,1,106)
INSERT INTO D_H VALUES(202,2,105)
INSERT INTO D_H VALUES(203,3,104)
INSERT INTO D_H VALUES(204,4,103)
INSERT INTO D_H VALUES(205,5,102)
INSERT INTO D_H VALUES(206,6,101)
INSERT INTO D_H VALUES(207,5,102)
INSERT INTO D_H VALUES(208,4,103)
INSERT INTO D_H VALUES(209,3,104)
INSERT INTO D_H VALUES(210,2,105)
INSERT INTO D_H VALUES(211,1,106)
INSERT INTO D_H VALUES(212,4,101)
INSERT INTO D_H VALUES(213,3,101)
INSERT INTO D_H VALUES(214,4,102)

--Find number of hospitals every doctor is visiting

SELECT D_no,D_name,COUNT(H_no) as No_Hospitals
FROM Doctor,Hospital,D_H
WHERE D_no=Ref_D_no and H_no=Ref_H_no
GROUP BY D_no,D_name

--Find the doctors visiting those hospitals that are in the same city in which they live

SELECT D_name,City
FROM Doctor,Hospital,D_H
WHERE D_no=Ref_D_no and H_no=Ref_H_no and Doctor.City=Hospital.H_City

--Display count of doctors visiting hospitals on MG Road

SELECT D_no,D_name,COUNT(D_no) as No_doctors,Street
FROM Doctor,Hospital,D_H
WHERE D_no=Ref_D_no and H_no=Ref_H_no and Street='MG Road'
GROUP BY D_no,D_name,Street

--Lsit Hospital wise Doctors

SELECT DISTINCT H_name,D_name
FROM Doctor,Hospital,D_H
WHERE D_no=Ref_D_no and H_no=Ref_H_no

