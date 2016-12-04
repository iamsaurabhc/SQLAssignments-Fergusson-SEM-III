CREATE DATABASE Assignment11
USE Assignment11
GO

CREATE TABLE Wholesaler
(
	W_no int PRIMARY KEY,
	W_name varchar(25),
	Addr varchar(25),
	City varchar(10)
);

INSERT INTO Wholesaler VALUES(101,'Shree Traders','Shivajinagar','Pune')
INSERT INTO Wholesaler VALUES(102,'Nirmal Enterprises','Sadashiv Peth','Pune')
INSERT INTO Wholesaler VALUES(103,'Om Associates','Pimpri','PCMC')
INSERT INTO Wholesaler VALUES(104,'Shanti Trading Coperation','Chinchwad','Nagpur')
INSERT INTO Wholesaler VALUES(105,'Prakash Traders','Deccan','Pune')
INSERT INTO Wholesaler VALUES(106,'Hari Enterprises','Nigdi','Nagpur')

CREATE TABLE Product
(
	P_no int PRIMARY KEY,
	P_name varchar(10)
); 

INSERT INTO Product VALUES(201,'Books')
INSERT INTO Product VALUES(202,'Mouse')
INSERT INTO Product VALUES(203,'Hardware')
INSERT INTO Product VALUES(204,'Stationery')
INSERT INTO Product VALUES(205,'Groceries')
INSERT INTO Product VALUES(206,'Appliances')

CREATE TABLE W_P
(
	W_P_no int PRIMARY KEY,
	Ref_W_no int FOREIGN KEY REFERENCES Wholesaler(W_no),
	Ref_P_no int FOREIGN KEY REFERENCES Product(P_no) 
);

INSERT INTO W_P VALUES(1,106,206)
INSERT INTO W_P VALUES(2,104,201)
INSERT INTO W_P VALUES(3,101,204)
INSERT INTO W_P VALUES(4,102,205)
INSERT INTO W_P VALUES(5,105,203)
INSERT INTO W_P VALUES(6,103,202)

--List the wholesalers of product-books

SELECT W_name
FROM Wholesaler,Product,W_P
WHERE W_no=Ref_W_no and P_no=Ref_P_no and P_name='Books'


--Count the numver of wholesalers in Nagpur

SELECT COUNT(DISTINCT W_no) as No_Wholesalers,City
FROM Wholesaler,Product,W_P
WHERE W_no=Ref_W_no and P_no=Ref_P_no and City='Nagpur'
GROUP BY City

--Delete record of wholesalers where product is mouse

DELETE FROM W_P
WHERE Ref_P_no=202

DELETE FROM Product
WHERE P_name='Mouse'


--List wholesaler wise list of products

SELECT DISTINCT W_name,P_name
FROM Wholesaler,Product,W_P
WHERE W_no=Ref_W_no and P_no=Ref_P_no

