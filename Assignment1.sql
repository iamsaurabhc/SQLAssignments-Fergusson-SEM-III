CREATE DATABASE Assignment1
USE Assignment1

CREATE TABLE Department
(
	Dept_no int NOT NULL PRIMARY KEY,
	Dept_name varchar(20) NULL,
	Area varchar(20) NULL,
);

CREATE TABLE Employee1
(
	Emp_no int NOT NULL PRIMARY KEY,
	Emp_name varchar(20) NULL,
	Salary int NULL,
	Commission int NULL,
	Designation varchar(20) NULL,
	Ref_Dept_no int NOT NULL FOREIGN KEY REFERENCES Department(Dept_no)
);

-- Insert the Values into Department Table
INSERT INTO Department VALUES (201,'Finance','Nashik');
INSERT INTO Department VALUES (202,'Office','Mumbai');
INSERT INTO Department VALUES (203,'Workshop','Pune');
INSERT INTO Department VALUES (204,'Office','Mumbai');
INSERT INTO Department VALUES (205,'Office','Pune');

-- Insert the Values into Employee Table
INSERT INTO Employee1 VALUES (101,'Tanmay',80000,15000,'Accountant',201);
INSERT INTO Employee1 VALUES (102,'Saurabh',67000,5000,'Engineer',202);
INSERT INTO Employee1 VALUES (103,'Akshaya',34000,12000,'Accountant',204);
INSERT INTO Employee1 VALUES (104,'Himani',65000,13000,'Engineer',203);
INSERT INTO Employee1 VALUES (105,'Priyanka',55000,11000,'Engineer',205);

--FIND  MAX, MIN AND AVERAGE SALARY FOR EACH DESIGNATIONS

SELECT Designation,MAX(Salary) as Max_Salary,MIN(Salary) as Min_Salary,AVG(Salary) as Avg_Salary
FROM Employee1 
GROUP BY Designation;


-- EMPLOYEES WORKING AT PUNE LOCATION

SELECT Emp_name,Dept_no,Area
FROM Employee1,Department
WHERE Area = 'Pune' and Ref_Dept_no=Dept_no;

-- Employees with Location Nashik and Designation Accountant

SELECT Emp_name,Area
FROM Employee1,Department
Where Ref_Dept_no=Dept_no and Area='Nashik' and Designation='Accountant';


-- Department Wise List of Employees

SELECT Dept_name,count(DISTINCT Emp_no)as No_Employees
FROM Employee1,Department
WHERE Ref_Dept_no=Dept_no
GROUP BY Dept_name;