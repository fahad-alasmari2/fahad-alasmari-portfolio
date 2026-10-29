
USE HR_Analytics_2026;
GO

SELECT
    d.DepartmentName AS Department,
    COUNT(e.EmployeeID) AS TotalEmployees,
    AVG(CAST(e.BasicSalary AS DECIMAL(18,2)))
        AS AverageSalary,
    SUM(e.BasicSalary) AS TotalBasicSalary
FROM dbo.Employees e
INNER JOIN dbo.Departments d
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalEmployees DESC;
