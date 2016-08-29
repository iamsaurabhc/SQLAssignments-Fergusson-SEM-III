CREATE DATABASE Company
ON (NAME=Company_db,FILENAME='E:\Database\Assignment1.mdf',
SIZE=10,MAXSIZE=50,FILEGROWTH=5)

LOG ON (NAME = Company_log, FILENAME='E:\Database\Assignment1log.ldf',
SIZE=5MB,MAXSIZE=25MB,FILEGROWTH=5MB);

USE Company
GO

--Create New Table named Employee
CREATE TABLE Employee
(
	Emp_no int NOT NULL PRIMARY KEY,
	Emp_name varchar(20) NULL,
	Salary int NULL,
	Commission int NULL,
	Designation varchar(20) NULL
);
-- New Table named Department
CREATE TABLE Department
(
	Dept_no int NOT NULL PRIMARY KEY,
	Dept_name varchar(20) NULL,
	Area varchar(20) NULL,
	Ref_Emp_no int NOT NULL FOREIGN KEY REFERENCES Employee(Emp_no)
);

-- Insert the Values into the Respective Tables
INSERT INTO Employee VALUES (101,'Saurabh',80000,15000,'Data Scientist');
INSERT INTO Employee VALUES (102,'Priyanka',67000,5000,'Software Developer');
INSERT INTO Employee VALUES (103,'Abhinandan',34000,12000,'Data Scientist');
INSERT INTO Employee VALUES (104,'Tanmay',65000,13000,'Software Developer');
INSERT INTO Employee VALUES (105,'Akshaya',55000,11000,'Software Developer');
GO
INSERT INTO Department VALUES (201,'Mathematics','Pune',101);
INSERT INTO Department VALUES (202,'Computer Science','Mumbai',102);
INSERT INTO Department VALUES (203,'Computer Science','Pune',101);
INSERT INTO Department VALUES (204,'Political Science','Mumbai',102);
INSERT INTO Department VALUES (205,'Computer Science','Pune',104);
INSERT INTO Department VALUES (206,'Physics','Mumbai',103);
INSERT INTO Department VALUES (207,'Physics','Pune',105);
INSERT INTO Department VALUES (208,'Computer Science','Mumbai',103);
GO
-- FIND  MAX, MIN AND AVERAGE SALARY FOR EACH DESIGNATIONS
SELECT Designation,MAX(Salary) as Max_Salary
FROM Employee GROUP BY Designation

SELECT Designation,MIN(Salary) as Min_Salary
FROM Employee GROUP BY Designation

SELECT Designation,AVG(Salary) as Avg_Salary
FROM Employee GROUP BY Designation

-- EMPLOYEES WORKING AT PUNE LOCATION

SELECT DISTINCT Emp_name 
FROM Employee,Department 
WHERE Area = 'Pune' and Ref_Emp_no = Emp_no

-- Employees with Location MUMBAI and Designation Software Developer

SELECT DISTINCT Emp_name
FROM Department, Employee
WHERE (Area='Mumbai' and Designation= 'Software Developer' and Emp_no = Ref_Emp_no)

-- Department Wise List of Employees

SELECT Dept_name,count(DISTINCT Emp_no)
FROM Employee,Department
WHERE Emp_no = Ref_Emp_no
GROUP BY Dept_name
