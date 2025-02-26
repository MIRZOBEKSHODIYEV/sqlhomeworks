CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 65000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');



	--1.Assign a Unique Rank to Each Employee Based on Salary

SELECT 
    Name, 
    Salary, 
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;

--2. Find Employees Who Have the Same Salary Rank
SELECT
RANK() OVER (ORDER BY Salary         ) AS SalaryRank
FROM Employees;



--3.Identify the Top 2 Highest Salaries in Each Department

WITH RankedEmployees AS (
    SELECT 
        EmployeeID, 
        Name, 
        Department, 
        Salary, 
        RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT * 
FROM RankedEmployees 
WHERE SalaryRank <= 2;

--4.Find the Lowest-Paid Employee in Each Department

WITH RankedEmployees AS (
    SELECT 
        EmployeeID, 
        Name, 
        Department, 
        Salary, 
        RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS SalaryRank
    FROM Employees
)
SELECT * 
FROM RankedEmployees 
WHERE SalaryRank <= 2;


--5. Calculate the Running Total of Salaries in Each Department

SELECT 
    Department, 
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;


--6. Calculate the Average Salary in Each Department Without GROUP BY

SELECT 
    Department, 
    AVG(Salary) AS Average
FROM Employees
GROUP BY Department;

--7. Find the Difference Between an Employee’s Salary and Their Department’s Average

SELECT 
    Department, 
    Salary - AVG(Salary) AS DIFFERENCE_VALUE
FROM Employees
GROUP BY Department;
