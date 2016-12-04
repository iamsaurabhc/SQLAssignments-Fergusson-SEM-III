CREATE DATABASE Assignment14
USE Assignment14
GO

CREATE TABLE Party
(
	P_code int PRIMARY KEY,
	Pr_name varchar(20)
)

INSERT INTO Party VALUES(11,'BJP')
INSERT INTO Party VALUES(12,'AAP')
INSERT INTO Party VALUES(13,'NCP')

CREATE TABLE Politician
(
	P_no int PRIMARY KEY,
	Pol_name varchar(20),
	P_desc varchar(20),
	Consti varchar(20),
	Ref_P_code int FOREIGN KEY REFERENCES Party(P_code)
)

INSERT INTO Politician VALUES(1,'Udit Raj','MP','North Delhi',11)
INSERT INTO Politician VALUES(2,'Supriya Sule','MP','Baramati',13)
INSERT INTO Politician VALUES(3,'Nitin Gadkari','MP','Nagpur',11)
INSERT INTO Politician VALUES(4,'Arvind Kejriwal','CM','New Delhi',12)
INSERT INTO Politician VALUES(5,'Suresh Lad','MLA','Karjat',13)
INSERT INTO Politician VALUES(6,'Devendra Fadnavis','CM','Nagpur South West',11)
INSERT INTO Politician VALUES(7,'Bhagwant Mann','MP','Sangrur',12)
INSERT INTO Politician VALUES(8,'Vijay Rupani','CM','Rajkot West',11)
INSERT INTO Politician VALUES(9,'Manoj Tiwari','MP','North Delhi',11)

--List all politicians of BJP

SELECT Pol_name,Pr_name
FROM Politician,Party
WHERE P_code=Ref_P_code and Pr_name='BJP'

--Count number of politician having political description as MP and constituency is North Delhi

SELECT COUNT(P_no) as No_politicians
FROM Politician,Party
WHERE P_code=Ref_P_code and P_desc='MP' and Consti='North Delhi'

--Count total number of politicians for each party

SELECT Pr_name,COUNT(Distinct P_no) as No_politicians
FROM Politician,Party
WHERE P_code=Ref_P_code
GROUP BY Pr_name

--List partywise politician names along with their constituency

SELECT Pr_name,Pol_name,Consti
FROM Politician,Party
WHERE P_code=Ref_P_code

