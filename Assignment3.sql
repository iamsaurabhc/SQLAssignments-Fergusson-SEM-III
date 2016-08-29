CREATE DATABASE Assignment3
ON (NAME=Assignment3,FILENAME='E:\Database\Assignment_db.mdf',
SIZE=10,MAXSIZE=50,FILEGROWTH=5)

USE Assignment3
GO
--Create Respective Tables
CREATE TABLE Property
(
	Property_no int NOT NULL PRIMARY KEY,
	Description_ varchar(50) NULL,
	Area int NULL
)
CREATE TABLE District
(
	District_code int NOT NULL PRIMARY KEY,
	District_name varchar(25) NULL,
	Tax_rate int NULL
)
CREATE TABLE Owner_
(
	Owner_name varchar(25) NULL,
	Owner_phone int NOT NULL PRIMARY KEY,
	Owner_address varchar(30) NULL,
)

-- Property and Owner are related with Many-to-One Relationship

ALTER TABLE Property
ADD Owner_id int NOT NULL FOREIGN KEY REFERENCES Owner_(Owner_phone)

-- Property and District are also related with Many-to-One Relationship

ALTER TABLE Property
ADD District_id int NOT NULL FOREIGN KEY REFERENCES District(District_code)

-- Insert Data into all the Tables
INSERT INTO Property VALUES (1001,'Villa with Swimming Pool',3800,123456,411012);
INSERT INTO Property VALUES (1002,'Deluxe PentHouse',4200,123457,411043);
INSERT INTO Property VALUES (1003,'Bunglow at a Posh Location',12000,123457,411035);
INSERT INTO Property VALUES (1004,'Flat with Huge Amenities',2200,123466,411043);
INSERT INTO Property VALUES (1005,'Condo with Personal Theatre',5500,123456,411012);
INSERT INTO Property VALUES (1006,'Duplex for Single Family',2600,123459,411001);
INSERT INTO Property VALUES (1007,'Two Floored Flat on 18th Floor',8000,123458,411024);
INSERT INTO Property VALUES (1008,'Three Floored Flat with Tree Balcony',8500,124456,411012);
GO
INSERT INTO District VALUES (411043,'Sangli',14);
INSERT INTO District VALUES (411012,'Pune',18);
INSERT INTO District VALUES (411001,'Mumbai',21);
INSERT INTO District VALUES (411024,'Nashik',12);
INSERT INTO District VALUES (411035,'Nagpur',11);
GO
INSERT INTO Owner_ VALUES ('Saurabh',123456,'Pune');
INSERT INTO Owner_ VALUES ('Mr. Patil',123457,'Mumbai');
INSERT INTO Owner_ VALUES ('Abhinandan',123458,'Nashik');
INSERT INTO Owner_ VALUES ('Tanmay',123459,'Mumbai');
INSERT INTO Owner_ VALUES ('Sagar',123466,'Nagpur');
INSERT INTO Owner_ VALUES ('Ram',123356,'Sangli');
INSERT INTO Owner_ VALUES ('Sita',124456,'Sangli');
GO

-- Query 1
 SELECT Owner_.Owner_name , Property.Description_ ,District.District_name
 FROM Owner_,Property,District 
 WHERE Owner_.Owner_phone = Property.Owner_id and District.District_code = Property.District_id

 -- Query 2 
 SELECT Property.Property_no , Property.Description_
 FROM Property
 WHERE Property.District_id  = 411043

 -- Query 3 
 SELECT SUM(Property.Area) as Total_Area_in_Pune
 FROM Property 
 WHERE Owner_id = 123456 and District_id = 411012

 -- Query 4 
 SELECT DISTINCT Owner_.Owner_name,Property.Area, District.District_name,District.Tax_rate
 FROM Owner_,Property,District 
 WHERE Owner_.Owner_phone = Property.Owner_id and District.District_code = Property.District_id
 GROUP BY District.District_name,Owner_.Owner_name,Property.Area,District.Tax_rate
