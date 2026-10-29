SELECT
    Region,
    COUNT(*) AS TotalOrders,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM dbo.SuperstoreSales
GROUP BY Region
ORDER BY TotalSales DESC;
