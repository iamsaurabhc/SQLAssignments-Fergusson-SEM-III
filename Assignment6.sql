CREATE DATABASE Assignment6
USE Assignment6
GO

CREATE TABLE Book
(
	B_no int PRIMARY KEY,
	B_name varchar(100),
	Pub_name varchar(50) NOT NULL
);

INSERT INTO Book VALUES(1001,'Operating System Concepts','ABC')
INSERT INTO Book VALUES(1002,'Principles of Real Analysis','Tata McGraw Hill')
INSERT INTO Book VALUES(1003,'Graph Theory','PHI')
INSERT INTO Book VALUES(1004,'C Programming Language','Thomson')
INSERT INTO Book VALUES(1005,'Fundamentals of computer','BPB')
INSERT INTO Book VALUES(1006,'Foundations of Complex Analysis','BPB')
INSERT INTO Book VALUES(1007,'Abstract Algebra','Narosa')
INSERT INTO Book VALUES(1008,'Numerical Methods','BPB')
INSERT INTO Book VALUES(1009,'Database Systems Concepts','TMH')
INSERT INTO Book VALUES(1010,'Data structures using C','SQW')
INSERT INTO Book VALUES(1011,'Software Engineering','GHT')
INSERT INTO Book VALUES(1012,'Ordinary differential equations','BPB')

CREATE TABLE Author
(
	A_no int PRIMARY KEY,
	A_name varchar(20) NOT NULL
);

INSERT INTO Author VALUES(1,'Galvin')
INSERT INTO Author VALUES(2,'Mathews')
INSERT INTO Author VALUES(3,'Gallian')
INSERT INTO Author VALUES(4,'Korth')
INSERT INTO Author VALUES(5,'Ponnuswamy')
INSERT INTO Author VALUES(6,'P K Sinha')
INSERT INTO Author VALUES(7,'Gilberg')
INSERT INTO Author VALUES(8,'Rudin')
INSERT INTO Author VALUES(9,'Holton')

CREATE TABLE B_A
(
	B_A_no int PRIMARY KEY,
	Ref_B_no int FOREIGN KEY REFERENCES Book(B_no),
	Ref_A_no int FOREIGN KEY REFERENCES Author(A_no)
);

INSERT INTO B_A VALUES(111,1005,2)
INSERT INTO B_A VALUES(112,1007,3)
INSERT INTO B_A VALUES(113,1002,8)
INSERT INTO B_A VALUES(114,1003,9)
INSERT INTO B_A VALUES(115,1001,1)
INSERT INTO B_A VALUES(116,1006,2)
INSERT INTO B_A VALUES(117,1008,2)
INSERT INTO B_A VALUES(118,1004,7)
INSERT INTO B_A VALUES(119,1009,4)
INSERT INTO B_A VALUES(120,1010,5)
INSERT INTO B_A VALUES(121,1011,6)
INSERT INTO B_A VALUES(122,1012,6)

--List the author whose more than two books are published by BPB

SELECT A_no,A_name,COUNT(*) as No_books
FROM Book,Author,B_A
WHERE B_no=Ref_B_no and A_no=Ref_A_no and Pub_name='BPB'
GROUP BY A_no,A_name
HAVING COUNT(*)>2

--Count number of books by each publisher

SELECT Pub_name,COUNT(B_no)as No_Books
FROM Book,Author,B_A
WHERE B_no=Ref_B_no and A_no=Ref_A_no
GROUP BY Pub_name

--List all books written by Korth

SELECT B_name,Pub_name
FROM Book,Author,B_A
WHERE B_no=Ref_B_no and A_no=Ref_A_no and A_name='Korth' 

--List book names along with publisher name

SELECT B_name,Pub_name
FROM Book,Author,B_A
WHERE B_no=Ref_B_no and A_no=Ref_A_no