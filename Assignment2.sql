CREATE DATABASE Assignment2
ON (NAME=Assignment2_db,FILENAME='E:\Database\Assignment2_db.mdf',
SIZE=10,MAXSIZE=50,FILEGROWTH=5)

USE Assignment2
GO

--Create New Table Named Employee--

CREATE TABLE Employee
(
	Emp_no int NOT NULL PRIMARY KEY,
	Name varchar(20) NULL,
	Emp_Address varchar(30) NULL,
	City varchar(20) NULL,
	Dept_name varchar(20) NULL
);

-- New Table named Project

CREATE TABLE Project
(
	Project_no int NOT NULL PRIMARY KEY,
	Name varchar(20) NULL,
	Project_Status varchar(2) NULL
);

-- Create New Table with Many-to-Many Relationship

CREATE TABLE Employee_Project
(
	Days_worked int NOT NULL,
	Emp_id int NOT NULL FOREIGN KEY REFERENCES Employee(Emp_no),
	Project_id int NOT NULL FOREIGN KEY REFERENCES Project(Project_no)
);
ALTER TABLE Employee_Project
ADD CONSTRAINT PKey PRIMARY KEY (Emp_id,Project_id);

-- Insert the Values into the Respective Tables

INSERT INTO Employee VALUES (101,'Saurabh','Dhanori','Pune','Computer Science');
INSERT INTO Employee VALUES (102,'Priyanka','Magarpatta','Pune','Mathematics');
INSERT INTO Employee VALUES (103,'Abhinandan','Koregaon Park','Pune','Physics');
INSERT INTO Employee VALUES (104,'Tanmay','Nigdi','Pune','Mathematics');
INSERT INTO Employee VALUES (105,'Akshaya','Sinhagad Road','Pune','Physics');
INSERT INTO Employee VALUES (106,'Dnyaneshwari','Pashan','Pune','Computer Science');
INSERT INTO Employee VALUES (107,'Riddhi','Kothrud','Pune','Mathematics');
INSERT INTO Employee VALUES (108,'Sagar','Fergusson Hostel','Pune','Computer Science');
GO
INSERT INTO Project VALUES (201,'KYC','P');
INSERT INTO Project VALUES (202,'Brown Leaf','I');
INSERT INTO Project VALUES (203,'Library Management','I');
INSERT INTO Project VALUES (204,'HyperLedger','P');
INSERT INTO Project VALUES (205,'Oculus VR','C');
GO
INSERT INTO Employee_Project VALUES (40,101,204);
INSERT INTO Employee_Project VALUES (77,101,201);
INSERT INTO Employee_Project VALUES (98,101,205);
INSERT INTO Employee_Project VALUES (41,102,202);
INSERT INTO Employee_Project VALUES (70,102,204);
INSERT INTO Employee_Project VALUES (48,102,205);
INSERT INTO Employee_Project VALUES (22,103,203);
INSERT INTO Employee_Project VALUES (12,103,204);
INSERT INTO Employee_Project VALUES (40,103,205);
INSERT INTO Employee_Project VALUES (35,104,201);
INSERT INTO Employee_Project VALUES (72,105,202);
INSERT INTO Employee_Project VALUES (49,106,203);
INSERT INTO Employee_Project VALUES (21,107,204);
INSERT INTO Employee_Project VALUES (65,108,205);
GO
-- Query 1 : Employee with more than 25 Days in any Project
SELECT DISTINCT Employee.Name as Employee_with_25days_worked
FROM Employee,Employee_Project
WHERE Days_worked > 25 and Employee.Emp_no = Employee_Project.Emp_id

-- Query 2 : Employee working on Project with "P"(Progressive) Status

SELECT DISTINCT Employee.Name as Employee_on_Progressive_Projects
FROM Employee,Project ,Employee_Project
WHERE Project .Project_Status = 'P' and Project.Project_no = Employee_Project.Project_id and Employee.Emp_no = Employee_Project.Emp_id

-- Query 3 : Project Name and # of Employees in "I" (Incomplete) Projects

SELECT DISTINCT Project.Name as Project_name, count(Employee.Emp_no) as Count_of_Emp
FROM Employee,Project ,Employee_Project
WHERE Project .Project_Status = 'I' and Project.Project_no = Employee_Project.Project_id and Employee.Emp_no = Employee_Project.Emp_id
GROUP BY Project.Name

-- Query 4 : List of Project Wise Employees with Project Status

SELECT DISTINCT Project.Name as Project, Employee.Name as EmployeeName, Project.Project_Status as Status_
FROM Employee,Project ,Employee_Project
GROUP BY Project.Name,Employee.Name,Project.Project_Status
