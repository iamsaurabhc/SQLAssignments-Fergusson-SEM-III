CREATE DATABASE Assignment2
USE Assignment2
GO

CREATE TABLE Employee
(
	Emp_no int PRIMARY KEY NOT NULL,
	Emp_name varchar(20),
	Addr varchar(20),
	City varchar(20),
	Dept_name varchar(20)
);

INSERT INTO Employee VALUES(1001,'Tanmay','Pimpri','Pune','Finance');
INSERT INTO Employee VALUES(1002,'Akshaya','Sinhgad','Pune','Management');
INSERT INTO Employee VALUES(1003,'Himani','Dhanori','Pune','Software');
INSERT INTO Employee VALUES(1004,'Priyanka','Magarpatta','Pune','Technical');
INSERT INTO Employee VALUES(1005,'Saurabh','Dhanori','Pune','Back Office');
INSERT INTO Employee VALUES(1006,'Sagar','FC Road','Pune','Inventory');

CREATE TABLE Project
(
	Pr_no int PRIMARY KEY,
	Pr_name varchar(20),
	Stat varchar(20)
);

INSERT INTO Project VALUES(1,'A','Complete');
INSERT INTO Project VALUES(2,'B','Progressive');
INSERT INTO Project VALUES(3,'C','Incomplete');
INSERT INTO Project VALUES(4,'D','Incomplete');
INSERT INTO Project VALUES(5,'E','Progressive');
INSERT INTO Project VALUES(6,'F','Complete');

CREATE TABLE Emp_Pr
(
	No_days int,
	Ref_Emp_no int FOREIGN KEY REFERENCES Employee(Emp_no),
	Ref_Pr_no int FOREIGN KEY REFERENCES Project(Pr_no)
);

INSERT INTO Emp_Pr VALUES(25,1006,1);
INSERT INTO Emp_Pr VALUES(24,1004,3);
INSERT INTO Emp_Pr VALUES(35,1003,5);
INSERT INTO Emp_Pr VALUES(40,1001,6);
INSERT INTO Emp_Pr VALUES(22,1002,2);
INSERT INTO Emp_Pr VALUES(47,1005,4);

--List of employees worked on a project for more than 25 days

SELECT Emp_no,Emp_name,No_days
FROM Employee,Emp_Pr
WHERE Ref_Emp_no=Emp_no and No_days>25;

--List of employees working on a project having status P-Progressive

SELECT Emp_no,Emp_name,Stat
FROM Employee,Project,Emp_Pr
WHERE Ref_Emp_no=Emp_no and Ref_Pr_no=Pr_no and Stat='Progressive';

--List project name and total no of employees worked on projects having status I-Incomplete

SELECT Pr_name,count(Emp_no) as No_Emp,Stat,Emp_name
FROM Employee,Project,Emp_Pr
WHERE Ref_Pr_no=Pr_no and Ref_Emp_no=Emp_no and Stat='Incomplete'
GROUP BY Pr_name,Stat,Emp_name;

--List project wise names of employees along with project status

SELECT Pr_name,Emp_no,Emp_name,Stat
FROM Employee,Project,Emp_Pr
WHERE Ref_Pr_no=Pr_no and Ref_Emp_no=Emp_no
GROUP BY Pr_name,Stat,Emp_no,Emp_name;
