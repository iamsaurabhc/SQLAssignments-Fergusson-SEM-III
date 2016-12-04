CREATE DATABASE Assignment7
USE Assignment7
GO

CREATE TABLE Dealer
(
	D_no int PRIMARY KEY,
	D_name varchar(50),
	Addr varchar(20),
);
CREATE TABLE Department1
(
	Dept_no int PRIMARY KEY,
	Dept_name varchar(20),
	Head varchar(20)
);

CREATE TABLE Book1
(
	B_no int PRIMARY KEY,
	B_name varchar(100),
	Price int,
	CHECK(Price>0),
	Ref_D_no int FOREIGN KEY REFERENCES Dealer(D_no),
	Ref_Dept_no int FOREIGN KEY REFERENCES Department1(Dept_no)
);

INSERT INTO Dealer VALUES(11,'ABC','Pune')
INSERT INTO Dealer VALUES(12,'Tata McGraw Hill','Nashik')
INSERT INTO Dealer VALUES(13,'PHI','Mumbai')
INSERT INTO Dealer VALUES(14,'Thomson','Nagpur')
INSERT INTO Dealer VALUES(15,'BPB','Thane')
INSERT INTO Dealer VALUES(16,'Narosa','Kolhapur')


INSERT INTO Department1 VALUES(1,'Maths','Mr.Pawar')
INSERT INTO Department1 VALUES(2,'Computer','Mr.Patil')
INSERT INTO Department1 VALUES(3,'Geography','Mrs.Gaikwad')
INSERT INTO Department1 VALUES(4,'Statistics','Mrs.Ghatpande')
INSERT INTO Department1 VALUES(5,'Botany','Mrs.DSouza')
INSERT INTO Department1 VALUES(6,'Physics','Mr.Gawade')

INSERT INTO Book1 VALUES(1001,'Operating System Concepts',500,11,2)
INSERT INTO Book1 VALUES(1002,'Indian and World Geography',400,12,3)
INSERT INTO Book1 VALUES(1003,'A Textbook of Botany',300,13,5)
INSERT INTO Book1 VALUES(1004,'Concepts of Physics',200,14,6)
INSERT INTO Book1 VALUES(1005,'Programmed Statistics',450,16,4)
INSERT INTO Book1 VALUES(1006,'Abstract Algebra',600,15,1)
INSERT INTO Book1 VALUES(1007,'Operating System Concepts 2',500,11,2)
INSERT INTO Book1 VALUES(1008,'Indian and World Geography 2',400,12,3)
INSERT INTO Book1 VALUES(1009,'A Textbook of Botany 2',300,13,5)
INSERT INTO Book1 VALUES(1010,'Concepts of Physics 2',200,14,6)
INSERT INTO Book1 VALUES(1011,'Programmed Statistics 2',450,16,4)
INSERT INTO Book1 VALUES(1012,'Abstract Algebra 2',600,15,1)

--Give the name of department spending maximum amount on books

CREATE VIEW Temp as
SELECT Dept_name,SUM(Price)as Total
FROM Book1,Department1
WHERE Dept_no=Ref_Dept_no
GROUP BY Dept_name

CREATE VIEW Temp1 as
SELECT MAX(Total)as Max_Expenditure
FROM
(
SELECT Dept_name,SUM(Price)as Total
FROM Book1,Department1
WHERE Dept_no=Ref_Dept_no
GROUP BY Dept_name
)as Temp

SELECT Dept_name,Max_Expenditure
FROM Temp,Temp1
WHERE Temp.Total=Temp1.Max_Expenditure


--List Department name to whom Tata McGraw Hill has supplied books

SELECT DISTINCT Dept_name
FROM Department1,Dealer,Book1
WHERE Dept_no=Ref_Dept_no and D_no=Ref_D_no and D_name='Tata McGraw Hill'

--List names and prices of books bought by computer department

SELECT B_name,Price
FROM Book1,Department1
WHERE Dept_no=Ref_Dept_no and Dept_name='Computer'

--Print Department wise Expenditure of books

SELECT Dept_name,SUM(Price)as Total_expenditure
FROM Book1,Department1
WHERE Dept_no=Ref_Dept_no
GROUP BY Dept_name
