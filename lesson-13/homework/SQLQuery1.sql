DECLARE @Year INT = 2024;
DECLARE @Month INT = 3;


WITH Dates AS (
    SELECT DATEFROMPARTS(@Year, @Month, 1) AS CalendarDate
    UNION ALL
    SELECT DATEADD(DAY, 1, CalendarDate)
    FROM Dates
    WHERE MONTH(DATEADD(DAY, 1, CalendarDate)) = @Month
)
SELECT 
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 1 THEN CalendarDate END) AS Sunday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 2 THEN CalendarDate END) AS Monday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 3 THEN CalendarDate END) AS Tuesday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 4 THEN CalendarDate END) AS Wednesday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 5 THEN CalendarDate END) AS Thursday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 6 THEN CalendarDate END) AS Friday,
    MIN(CASE WHEN DATEPART(WEEKDAY, CalendarDate) = 7 THEN CalendarDate END) AS Saturday
FROM Dates
GROUP BY DATEPART(WEEK, CalendarDate)
OPTION (MAXRECURSION 100);
