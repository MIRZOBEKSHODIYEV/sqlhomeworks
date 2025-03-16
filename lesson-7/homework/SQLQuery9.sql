CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);





SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerName = o.CustomerName
ORDER BY c.CustomerName;





--2

SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerName = o.CustomerName
WHERE o.OrderID IS NULL;


-- 3

SELECT 
    o.OrderID,
    o.CustomerName,
    o.OrderDate,
    p.ProductName,
    od.Quantity
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderID;



-- 4

SELECT CustomerName, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerName
HAVING COUNT(OrderID) > 1
ORDER BY TotalOrders DESC;


-- 5
WITH RankedProducts AS (
    SELECT 
        o.OrderID,
        p.ProductName,
        od.Quantity,
        (p.Price * od.Quantity) AS TotalCost,
        ROW_NUMBER() OVER (PARTITION BY o.OrderID ORDER BY (p.Price * od.Quantity) DESC) AS Rank
    FROM Orders o
    INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
    INNER JOIN Products p ON od.ProductID = p.ProductID
)
SELECT 
    OrderID,
    ProductName AS MostExpensiveProduct,
    Quantity,
    TotalCost
FROM RankedProducts
WHERE Rank = 1
ORDER BY OrderID;



--6
WITH LatestOrders AS (
    SELECT 
        CustomerName,
        OrderID,
        OrderDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerName ORDER BY OrderDate DESC) AS Rank
    FROM Orders
)
SELECT 
    CustomerName,
    OrderID AS LatestOrderID,
    OrderDate AS LatestOrderDate
FROM LatestOrders
WHERE Rank = 1
ORDER BY OrderDate DESC;



--7

WITH CustomerOrders AS (
    SELECT DISTINCT o.CustomerName, p.Category
    FROM Orders o
    INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
    INNER JOIN Products p ON od.ProductID = p.ProductID
)
SELECT CustomerName
FROM CustomerOrders
GROUP BY CustomerName
HAVING COUNT(DISTINCT Category) = 1 AND MAX(Category) = 'Electronics';
