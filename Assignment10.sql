CREATE DATABASE Assignment10
USE Assignment10
GO

CREATE TABLE Country
(
	Con_code int PRIMARY KEY,
	Con_name varchar(20) NOT NULL,
	Capital varchar(20)
);

INSERT INTO Country VALUES(1,'India','Delhi')
INSERT INTO Country VALUES(2,'USA','Washington DC')
INSERT INTO Country VALUES(3,'Russia','Moscow')
INSERT INTO Country VALUES(4,'Japan','Tokyo')
INSERT INTO Country VALUES(5,'French Guiana','Cayenne')
INSERT INTO Country VALUES(6,'Suriname','Paramaribo')
INSERT INTO Country VALUES(7,'Iceland','Reykjavik')
INSERT INTO Country VALUES(8,'China','Beijing')

CREATE TABLE Population1
(
	Pop_code int PRIMARY KEY,
	Pop bigint,
	Ref_Con_code int FOREIGN KEY REFERENCES Country(Con_code)
);

INSERT INTO Population1 VALUES(101,1251695584,1)
INSERT INTO Population1 VALUES(102,217000,5)
INSERT INTO Population1 VALUES(103,1367485388,8)
INSERT INTO Population1 VALUES(104,491989,6)
INSERT INTO Population1 VALUES(105,318452,7)
INSERT INTO Population1 VALUES(106,126919659,4)
INSERT INTO Population1 VALUES(107,142423773,3)
INSERT INTO Population1 VALUES(108,321368864,2)


--List country with highest population
--Total List
SELECT MAX(Pop) as Max_populatio
FROM Country,Population1
WHERE Con_code=Ref_Con_code
GROUP BY pop
ORDER BY Pop DESC

--Max Population
SELECT TOP 1 Pop
FROM (
      SELECT DISTINCT TOP 1 Pop
      FROM Country,Population1
      ORDER BY Pop DESC
      ) AS Third_pop
ORDER BY Pop

--Give name and population of country whose capital is Tokyo

SELECT Con_name,Pop
FROM Country,Population1
WHERE Con_code=Ref_Con_code and Capital='Tokyo'

--Give name of deserted countries

SELECT Con_name
FROM Country,Population1
WHERE Con_code=Ref_Con_code and Pop < 500000

--List country wise population

SELECT  Con_name,Pop
FROM Country,Population1
WHERE Con_code=Ref_Con_code
ORDER BY Con_name ASC
