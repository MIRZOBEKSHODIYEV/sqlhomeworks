CREATE TABLE Employes
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employes (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');
select * from Employes


SELECT 
    e.EmployeeID, 
    e.ManagerID, 
    e.JobTitle, 
    CASE 
        WHEN e.ManagerID IS NULL THEN 0  
        WHEN m.ManagerID IS NULL THEN 1  
        ELSE 2  
    END AS Depth
FROM Employes e
LEFT JOIN Employes m ON e.ManagerID = m.EmployeeID
ORDER BY Depth, EmployeeID;

