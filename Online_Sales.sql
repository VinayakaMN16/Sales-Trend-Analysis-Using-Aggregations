--1.Monthly Revenue + Order Volume
SELECT 
    FORMAT(o.Order_Date, 'yyyy-MM') AS YearMonth,
    COUNT(DISTINCT o.Order_ID) AS OrderVolume,
    SUM(d.Amount) AS TotalRevenue,
    ROUND(
        CAST(SUM(d.Amount) AS DECIMAL(18,2)) / NULLIF(COUNT(DISTINCT o.Order_ID),0),
        2
    ) AS AvgOrderValue
FROM Orders o
JOIN Details d
    ON o.Order_ID = d.Order_ID
GROUP BY FORMAT(o.Order_Date, 'yyyy-MM')
ORDER BY YearMonth;


select * from [dbo].[Orders]
select * from [dbo].[Details]
