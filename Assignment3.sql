CREATE DATABASE Assignment3
USE Assignment3
GO
--Table for Owner
CREATE TABLE Owner1
(
	O_name varchar(20) PRIMARY KEY,
	Addr varchar(20),
	Phone varchar(20)
);
--Table for District
CREATE TABLE District
(
	D_code int PRIMARY KEY,
	D_name varchar(20),
	Taxrate float,
);
--Table for Property
CREATE TABLE Property
(
	Pro_no int PRIMARY KEY,
	Descp  varchar(20),
	Area int,
	Ref_O_name varchar(20) NOT NULL FOREIGN KEY REFERENCES Owner1(O_name),
	Ref_D_code int NOT NULL FOREIGN KEY REFERENCES District(D_code)
);

INSERT INTO Owner1 VALUES('Tanmay','Pimpri','9988776655')
INSERT INTO Owner1 VALUES('Akshaya','Sinhagad','7788996655')
INSERT INTO Owner1 VALUES('Himani','Dhanori','2255887744')
INSERT INTO Owner1 VALUES('Priyanka','Magarpatta','9988556644')
INSERT INTO Owner1 VALUES('Saurabh','Dhanori','1155447788')
INSERT INTO Owner1 VALUES('Sagar','FC Road','55666447788')


INSERT INTO District VALUES(1,'Pune',5)
INSERT INTO District VALUES(2,'Sangli',3)
INSERT INTO District VALUES(3,'Nashik',7)
INSERT INTO District VALUES(4,'Mumbai',8)
INSERT INTO District VALUES(5,'Thane',4)
INSERT INTO District VALUES(6,'Nagpur',9)

INSERT INTO Property VALUES(101,'Residential',15000,'Tanmay',2)
INSERT INTO Property VALUES(102,'Commercial',17000,'Saurabh',4)
INSERT INTO Property VALUES(103,'Agricultural',28000,'Priyanka',6)
INSERT INTO Property VALUES(104,'Residential',65000,'Sagar',5)
INSERT INTO Property VALUES(105,'Commercial',55000,'Himani',1)
INSERT INTO Property VALUES(106,'Agricultural',12000,'Akshaya',3)

--List owner,property name,district

SELECT O_name,Pro_no,Descp,Area,D_name
FROM Property,Owner1,District
WHERE Ref_O_name=O_name and Ref_D_code=D_code

--List all properties in Sangli district

SELECT Pro_no,Descp,D_name
FROM Property,District
WHERE Ref_D_code=D_code and D_name='Sangli'

--List total property area owned by Himani(Mr. Patil) in Pune

SELECT O_name,Pro_no,Descp
FROM Property,District,Owner1
WHERE Ref_O_name=O_name and D_name='Pune' and O_name='Himani'

--List district wise property of owner with tax rate

SELECT D_name,O_name,Taxrate
FROM Property,District,Owner1
WHERE Ref_O_name=O_name and Ref_D_code=D_code
GROUP BY D_name,O_name,Taxrate