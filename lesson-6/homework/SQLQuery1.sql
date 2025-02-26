CREATE TABLE Employeees (
    EmployeeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary INT
);


INSERT INTO Employeees (EmployeeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

SELECT * FROM Employeees

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

SELECT * FROM Departments

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    EmployeeeID INT
);

INSERT INTO Projects (ProjectID, ProjectName, EmployeeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);

SELECT * FROM Projects


-- INNER JOIN

--1. Write a query to get a list of employees along with their department names.

SELECT e.EmployeeeID, e.Name, d.DepartmentName
FROM Employeees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;



--2.LEFT JOIN

-- Write a query to list all employees, including those who are not assigned to any department.
SELECT e.EmployeeeID, e.Name, e.DepartmentID, d.DepartmentName
FROM Employeees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;


-- 3.  RIGHT JOIN

-- Write a query to list all departments, including those without employees.
SELECT e.EmployeeeID, e.Name, d.DepartmentID, d.DepartmentName
FROM Employeees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;






-- 4.  FULL OUTER JOIN

 -- Write a query to retrieve all employees and all departments, even if there’s no match between them.

 SELECT e.EmployeeeID, e.Name, d.DepartmentID, d.DepartmentName
FROM Employeees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;


-- 5.JOIN with Aggregation

-- Write a query to find the total salary expense for each department.

SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Employeees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


-- 6.CROSS JOIN

-- Write a query to generate all possible combinations of departments and projects.


SELECT d.DepartmentName, p.ProjectName
FROM Departments d
CROSS JOIN Projects p;

SELECT e.EmployeeeID, e.Name, d.DepartmentName, p.ProjectName
FROM Employeees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p ON e.EmployeeeID = p.EmployeeeID;

