CREATE TABLE @MissingOrders 
(
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO @MissingOrders (OrderID, CustomerName, Product, Quantity)
SELECT 
    OrderID,
    CustomerName,
    Product,
    Quantity
FROM Orders_DB1
WHERE OrderID NOT IN (SELECT OrderID FROM Orders_DB2);

SELECT * FROM @MissingOrders;
