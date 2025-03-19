CREATE TABLE Factorials (
    N INT PRIMARY KEY,
    Factorial BIGINT
);

WITH RECURSIVE FactorialCTE (N, Factorial) AS (
    SELECT 1, 1   1! = 1
    UNION ALL
    SELECT N + 1, Factorial * (N + 1)
    FROM FactorialCTE
    WHERE N < 10  
)
--INSERT INTO Factorials (N, Factorial)
--SELECT * FROM FactorialCTE;

SELECT * FROM Factorials;
