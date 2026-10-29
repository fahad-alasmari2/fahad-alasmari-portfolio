
USE HR_Analytics_2026;
GO

WITH MonthlyPayroll AS (
    SELECT
        DATEFROMPARTS(
            YEAR(PayrollMonth),
            MONTH(PayrollMonth),
            1
        ) AS PayrollMonth,
        SUM(TotalSalary) AS TotalPayroll
    FROM dbo.Payroll
    GROUP BY
        YEAR(PayrollMonth),
        MONTH(PayrollMonth)
),
PayrollGrowth AS (
    SELECT
        PayrollMonth,
        TotalPayroll,
        LAG(TotalPayroll) OVER (
            ORDER BY PayrollMonth
        ) AS PreviousMonthPayroll
    FROM MonthlyPayroll
)
SELECT
    PayrollMonth,
    TotalPayroll,
    PreviousMonthPayroll,
    ROUND(
        (TotalPayroll - PreviousMonthPayroll)
        * 100.0 /
        NULLIF(PreviousMonthPayroll, 0),
        2
    ) AS GrowthPercentage
FROM PayrollGrowth
ORDER BY PayrollMonth;

