SELECT
    Segment,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(AVG(Sales), 2) AS AverageLineSales
FROM dbo.SuperstoreSales
GROUP BY Segment
ORDER BY TotalSales DESC;
