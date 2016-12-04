CREATE DATABASE Assignment12
USE Assignment12
GO

CREATE TABLE Item
(
	Item_no int PRIMARY KEY,
	I_name varchar(20),
	Quantity int,
	CHECK(Quantity > 5)
);

INSERT INTO Item VALUES(1,'Monitor',7)
INSERT INTO Item VALUES(2,'Keyboard',15)
INSERT INTO Item VALUES(3,'Mouse',20)
INSERT INTO Item VALUES(4,'Book',8)
INSERT INTO Item VALUES(5,'Speaker',20)
INSERT INTO Item VALUES(6,'Mobile',30)
INSERT INTO Item VALUES(7,'Fan',14)

--Check Quantity > 5 case-> INSERT INTO Item VALUES(9,'Monitor',4)

CREATE TABLE Supplier
(
	S_no int PRIMARY KEY,
	S_name varchar(25),
	Addr varchar(25),
	City varchar(10),
	Phone bigint
);

INSERT INTO Supplier VALUES(101,'Shree Traders','Shivajinagar','Pune',55887744)
INSERT INTO Supplier VALUES(102,'Nirmal Enterprises','Sadashiv Peth','Pune',88775566)
INSERT INTO Supplier VALUES(103,'Om Associates','Pimpri','PCMC',55663322)
INSERT INTO Supplier VALUES(104,'Shanti Trading Coperation','Chicholi','Nagpur',11226655)
INSERT INTO Supplier VALUES(105,'Prakash Traders','Deccan','Pune',66773311)
INSERT INTO Supplier VALUES(106,'Hari Enterprises','Mansar','Nagpur',22887744)
INSERT INTO Supplier VALUES(107,'Baba Enterprises','Nigdi','PCMC',66772211)

CREATE TABLE I_S
(
	I_S_no int PRIMARY KEY,
	Rate int,
	Disc int,
	Ref_Item_no int FOREIGN KEY REFERENCES Item(Item_no),
	Ref_S_no int FOREIGN KEY REFERENCES Supplier(S_no) 
);

INSERT INTO  I_S VALUES(11,3000,5,7,105)
INSERT INTO  I_S VALUES(12,4500,10,5,101)
INSERT INTO  I_S VALUES(13,10000,15,2,102)
INSERT INTO  I_S VALUES(14,15000,25,1,104)
INSERT INTO  I_S VALUES(15,7500,7,3,103)
INSERT INTO  I_S VALUES(16,2500,4,4,107)
INSERT INTO  I_S VALUES(17,8900,12,6,106)

--SELECT ALL

SELECT *
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no

--Increase rate by 5% of item-Keyboard

SELECT Rate+(Rate*0.05)as Rate
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no and I_name='Keyboard'


--List suppliers of same city supplying different items

SELECT City,Count(S_no) as No_suppliers_samecity
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no
GROUP BY City

--List the item details of items who have maximum discount and rate > 3000

SELECT MAX(Temp.m_disc)
FROM
(
SELECT DISTINCT Item_no,I_name,Rate, MAX(Disc) as m_disc
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no
and Rate > 3000
GROUP BY Item_no,I_name,Rate
)Temp

CREATE VIEW Temp4 as
SELECT DISTINCT Item_no,I_name,Rate, MAX(Disc) as m_disc
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no
and Rate > 3000
GROUP BY Item_no,I_name,Rate

CREATE VIEW Temp5 as
SELECT MAX(Temp.m_disc) as M_disc1
FROM
(
SELECT DISTINCT Item_no,I_name,Rate, MAX(Disc) as m_disc
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no
and Rate > 3000
GROUP BY Item_no,I_name,Rate
)Temp


SELECT I_name,Rate,M_disc1
FROM Temp4,Temp5
WHERE Temp4.m_disc=Temp5.M_disc1




--List supplier wise items supplied

SELECT S_name,I_name
FROM Item,Supplier,I_S
WHERE Item_no=Ref_Item_no and S_no=Ref_S_no
ORDER BY S_name ASC
