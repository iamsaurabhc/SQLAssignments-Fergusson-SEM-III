CREATE DATABASE Assignment5
USE Assignment5
GO

CREATE TABLE Student
(
	Roll_no int PRIMARY KEY,
	S_name varchar(20),
	Marks float
);

INSERT INTO Student VALUES(1,'Tanmay',70)
INSERT INTO Student VALUES(2,'Akshaya',75)
INSERT INTO Student VALUES(3,'Saurabh',79)
INSERT INTO Student VALUES(4,'Priyanka',72)
INSERT INTO Student VALUES(5,'Sagar',68)
INSERT INTO Student VALUES(6,'Himani',80)

CREATE TABLE Teacher
(
	T_no int PRIMARY KEY,
	T_name varchar(20)
);

INSERT INTO Teacher VALUES(101,'Mr.Pawar')
INSERT INTO Teacher VALUES(102,'Mr.Patil')
INSERT INTO Teacher VALUES(103,'Mrs.Gaikwad')
INSERT INTO Teacher VALUES(104,'Mrs.Ghatpande')
INSERT INTO Teacher VALUES(105,'Mr.Gawade')
INSERT INTO Teacher VALUES(106,'Mrs.DSouza')

CREATE TABLE S_T
(
	S_T_no int PRIMARY KEY,
	Class varchar(20),
	Sub varchar(20),
	Ref_Roll_no int FOREIGN KEY REFERENCES Student(Roll_no),
	Ref_T_no int FOREIGN KEY REFERENCES Teacher(T_no)
);

INSERT INTO S_T VALUES(121,'FY','C++',1,101)
INSERT INTO S_T VALUES(122,'SY','DAA',3,102)
INSERT INTO S_T VALUES(123,'TY','Topology',4,102)
INSERT INTO S_T VALUES(124,'SY','DBMS',2,104)
INSERT INTO S_T VALUES(125,'FY','Data Structures',5,106)
INSERT INTO S_T VALUES(126,'TY','Complex Analysis',6,102)
INSERT INTO S_T VALUES(127,'FY','C',1,101)
INSERT INTO S_T VALUES(128,'FY','JAVA',1,101)
INSERT INTO S_T VALUES(129,'TY','C++',4,105)
INSERT INTO S_T VALUES(130,'SY','C#',3,103)
INSERT INTO S_T VALUES(131,'FY','C',5,101)

--List student to whom Mr.Pawar is teaching more than two subjects

SELECT DISTINCT S_name,COUNT(*) as Sub
FROM Student,Teacher,S_T
WHERE Roll_no=Ref_Roll_no and T_no=Ref_T_no
and T_name='Mr.Pawar'
GROUP BY S_name
HAVING COUNT(*)>2

--List all TY students who have scored Distinction in subject taught by Mr.Patil

SELECT DISTINCT Roll_no,S_name,Marks
FROM Student,Teacher,S_T
WHERE Roll_no=Ref_Roll_no and T_no=Ref_T_no
and T_name='Mr.Patil' and Marks > 75 and Class='TY'

--List all teachers teaching c++

SELECT DISTINCT T_name,Sub
FROM Student,Teacher,S_T
WHERE Roll_no=Ref_Roll_no and T_no=Ref_T_no
and Sub like 'C++'

--Count class wise number of students

SELECT Class,COUNT(DISTINCT Roll_no) as No_Students
FROM Student,S_T
WHERE Roll_no=Ref_Roll_no
GROUP BY Class
