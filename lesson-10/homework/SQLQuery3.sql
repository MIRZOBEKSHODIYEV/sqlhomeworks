WITH AllDays AS (
    SELECT TOP 40 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS DayNum
    FROM master.dbo.spt_values
),
ShipmentsWithZeros AS (
    SELECT 
        a.DayNum, 
        COALESCE(s.Num, 0) AS Num
    FROM AllDays a
    LEFT JOIN Shipments s ON a.DayNum = s.N
),
WITH AllDays AS (
    SELECT TOP 40 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS DayNum
    FROM master.dbo.spt_values
),
ShipmentsWithZeros AS (
    SELECT 
        a.DayNum, 
        COALESCE(s.Num, 0) AS Num
    FROM AllDays a
    LEFT JOIN Shipments s ON a.DayNum = s.N
),
RankedShipments AS (
    SELECT 
        Num,
        ROW_NUMBER() OVER (ORDER BY Num) AS RowAsc,
        COUNT(*) OVER () AS TotalCount
    FROM ShipmentsWithZeros
)
SELECT 
    AVG(Num * 1.0) AS Median
FROM RankedShipments
WHERE RowAsc IN (TotalCount / 2, TotalCount / 2 + 1);
