WITH GroupedData AS (
    SELECT 
        "Step Number",
        Status,
        "Step Number" - DENSE_RANK() OVER (PARTITION BY Status ORDER BY "Step Number") AS GroupID
    FROM Groupings
)
SELECT 
    MIN("Step Number") AS "Min Step Number",
    MAX("Step Number") AS "Max Step Number",
    Status,
    COUNT(*) AS "Consecutive Count"
FROM GroupedData
GROUP BY Status, GroupID
ORDER BY "Min Step Number";
