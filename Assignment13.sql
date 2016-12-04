CREATE DATABASE Assignment13
USE Assignment13
GO

CREATE TABLE Customer
(
	C_no int PRIMARY KEY,
	C_name varchar(20) NOT NULL,
	Addr varchar(20)
)

INSERT INTO Customer VALUES(1,'Tanmay','Pune')
INSERT INTO Customer VALUES(2,'Saurabh','Delhi')
INSERT INTO Customer VALUES(3,'Abhinandan','Nagpur')
INSERT INTO Customer VALUES(4,'Himani','Pune')
INSERT INTO Customer VALUES(5,'Akshaya','Chennai')
INSERT INTO Customer VALUES(6,'Priyanka','Delhi')


CREATE TABLE Quotation
(
	Q_no int PRIMARY KEY,
	Descp varchar(20),
	Amt_q int,
	CHECK (Q_no > 100)
)

INSERT INTO Quotation VALUES(101,'Microwave',10000)
INSERT INTO Quotation VALUES(102,'Fridge',250000)
INSERT INTO Quotation VALUES(103,'TV',80000)
INSERT INTO Quotation VALUES(104,'Fan',2000)
INSERT INTO Quotation VALUES(105,'AC',30000)
INSERT INTO Quotation VALUES(106,'Camera',35000)
INSERT INTO Quotation VALUES(107,'Mobile',32000)


CREATE TABLE C_Q
(
	C_Q_no int PRIMARY KEY,
	Ref_C_no int FOREIGN KEY REFERENCES Customer(C_no),
	Ref_Q_no int FOREIGN KEY REFERENCES Quotation(Q_no)
)

INSERT INTO C_Q VALUES(11,1,102)
INSERT INTO C_Q VALUES(12,2,101)
INSERT INTO C_Q VALUES(13,1,103)
INSERT INTO C_Q VALUES(14,3,104)
INSERT INTO C_Q VALUES(15,1,105)
INSERT INTO C_Q VALUES(16,4,101)
INSERT INTO C_Q VALUES(17,1,101)
INSERT INTO C_Q VALUES(18,5,104)
INSERT INTO C_Q VALUES(19,6,105)
INSERT INTO C_Q VALUES(20,1,107)
INSERT INTO C_Q VALUES(21,2,102)
INSERT INTO C_Q VALUES(22,3,107)
INSERT INTO C_Q VALUES(23,4,106)

--List the customers who want to purchase Microwave

SELECT C_no,C_name,Descp
FROM Customer,Quotation,C_Q
WHERE C_no=Ref_C_no and Q_no=Ref_Q_no and Descp='Microwave'

--Find number of customers who are demanding more than one item and thier total
--XXXXXXXXXX
SELECT COUNT(Descp) as No_Customers
FROM Customer,Quotation,C_Q
WHERE C_no=Ref_C_no and Q_no=Ref_Q_no 

--List all customer from Delhi with than 4 quotations

SELECT DISTINCT C_name
FROM Customer,Quotation,C_Q
WHERE C_no=Ref_C_no and Q_no=Ref_Q_no and Addr='Delhi'

--List Customer wise Quotations

SELECT DISTINCT C_name,Descp
FROM Customer,Quotation,C_Q
WHERE C_no=Ref_C_no and Q_no=Ref_Q_no 
