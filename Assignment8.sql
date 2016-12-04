CREATE DATABASE Assignment8
USE Assignment8
GO

CREATE TABLE Machine
(
	M_no int PRIMARY KEY,
	M_name varchar(20) NOT NULL,
	M_type varchar(20),
	M_cost float
)

INSERT INTO Machine VALUES(1,'Drill machine','Constructional',8000)
INSERT INTO Machine VALUES(2,'Vacuum cleaner','Cleaning',15000)
INSERT INTO Machine VALUES(3,'Refrigerator','Home appliance',20000)
INSERT INTO Machine VALUES(4,'Air conditioner','Cooling',35000)
INSERT INTO Machine VALUES(5,'Water heater','Heating',7000)
INSERT INTO Machine VALUES(6,'Cutting machine','Constructional',10000)

CREATE TABLE Part
(
	P_no int PRIMARY KEY,
	P_name varchar(20),
	P_descp varchar(20),
	Ref_M_no int NOT NULL FOREIGN KEY REFERENCES Machine(M_no)
)

INSERT INTO Part VALUES(101,'Motor','www',1)
INSERT INTO Part VALUES(102,'Blade','xxx',6)
INSERT INTO Part VALUES(103,'Heating coil','rrr',5)
INSERT INTO Part VALUES(104,'Suction motor','sss',2)
INSERT INTO Part VALUES(105,'Fan','fff',4)
INSERT INTO Part VALUES(106,'Compressor','hhh',3)
INSERT INTO Part VALUES(107,'Compressor','hjk',4)
INSERT INTO Part VALUES(108,'Motor','ww',6)

--Increase cost of machine by 5%

SELECT M_name,M_cost+(M_cost*0.05) as M_newcost
FROM Machine

--Display Machine name with parts

SELECT  DISTINCT M_name,P_name
FROM Machine,Part
WHERE M_no=Ref_M_no

--List all parts whose machine cost is greater than 10000

SELECT DISTINCT P_name--,M_cost
FROM Machine,Part
WHERE M_no=Ref_M_no and M_cost > 10000

--Display all machine names with number of parts that each machine requires

SELECT M_name,COUNT(P_no) as No_parts
FROM Machine,Part
WHERE M_no=Ref_M_no
GROUP BY M_name