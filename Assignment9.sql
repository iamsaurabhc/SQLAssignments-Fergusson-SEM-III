CREATE DATABASE Assignment9
USE Assignment9
GO

CREATE TABLE Student1
(
	S_no int PRIMARY KEY,
	S_name varchar(20),
	Addr varchar(10),
	Class varchar(2)
);

INSERT INTO Student1 VALUES(1,'Tanmay','Pimpri','FY')
INSERT INTO Student1 VALUES(2,'Saurabh','Kothrud','SY')
INSERT INTO Student1 VALUES(3,'Sagar','FC Road','TY')
INSERT INTO Student1 VALUES(4,'Himani','Dhanori','FY')
INSERT INTO Student1 VALUES(5,'Priyanka','Mumbai','SY')
INSERT INTO Student1 VALUES(6,'Akshaya','Anandnagar','TY')

CREATE TABLE Subject1
(
	Sub_no int PRIMARY KEY,
	Sub_name varchar(20),
);

INSERT INTO Subject1 VALUES(101,'Computer Science')
INSERT INTO Subject1 VALUES(102,'Maths')
INSERT INTO Subject1 VALUES(103,'Physics')
INSERT INTO Subject1 VALUES(104,'Organic Chemistry')
INSERT INTO Subject1 VALUES(105,'Botany')
INSERT INTO Subject1 VALUES(106,'Geology')

CREATE TABLE S_M
(
	S_M_no int PRIMARY KEY,
	Marks int,
	Ref_S_no int FOREIGN KEY REFERENCES Student1(S_no),
	Ref_Sub_no int FOREIGN KEY REFERENCES Subject1(SUB_no)
);

INSERT INTO S_M VALUES(111,65,2,106)
INSERT INTO S_M VALUES(112,70,3,104)
INSERT INTO S_M VALUES(113,68,5,103)
INSERT INTO S_M VALUES(114,72,6,102)
INSERT INTO S_M VALUES(115,77,1,101)
INSERT INTO S_M VALUES(116,80,4,105)
INSERT INTO S_M VALUES(117,89,5,105)
INSERT INTO S_M VALUES(118,79,2,103)
INSERT INTO S_M VALUES(119,49,3,102)--
INSERT INTO S_M VALUES(121,70,1,104)
INSERT INTO S_M VALUES(122,68,5,103)
INSERT INTO S_M VALUES(123,72,2,102)
INSERT INTO S_M VALUES(124,77,3,101)
INSERT INTO S_M VALUES(125,80,6,105)
INSERT INTO S_M VALUES(126,81,5,104)


--Find name of student who had opted for Computer Science

SELECT S_no,S_name,Sub_name
FROM Student1,Subject1,S_M
WHERE S_no=Ref_S_no and Sub_no=Ref_Sub_no and Sub_name='Computer Science'

--Find number of students having address Kothrud and marks > 60

SELECT COUNT(DISTINCT S_no) as No_Students,S_name
FROM Student1,Subject1,S_M
WHERE S_no=Ref_S_no and Sub_no=Ref_Sub_no
and Addr='Kothrud' and Marks>60
GROUP BY S_name


--Find total number of students of Mumbai for Organic Chemistry

SELECT DISTINCT S_name,COUNT(S_no) as No_Students
FROM Student1,Subject1,S_M
WHERE S_no=Ref_S_no and Sub_no=Ref_Sub_no and Addr='Mumbai' and Sub_name='Organic Chemistry'
GROUP BY S_name

--List subjects with minimum numberof students registered

CREATE VIEW Temp2 as
SELECT Sub_name,COUNT(S_no) as No_Students
FROM Student1,Subject1,S_M
WHERE S_no=Ref_S_no and Sub_no=Ref_Sub_no
GROUP BY Sub_name

CREATE VIEW Temp3 as
SELECT MIN(No_Students) as No_Students1
FROM
(SELECT Sub_name,COUNT(S_no) as No_Students
FROM Student1,Subject1,S_M
WHERE S_no=Ref_S_no and Sub_no=Ref_Sub_no
GROUP BY Sub_name)as Temp

SELECT Sub_name,No_Students1
FROM Temp2,Temp3
WHERE Temp2.No_Students=Temp3.No_Students1