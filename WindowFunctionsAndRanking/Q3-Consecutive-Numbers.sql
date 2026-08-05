-- Write your PostgreSQL query statement below
;WITH CTE AS(
SELECT
    LAG(num) OVER(ORDER BY id) Lag,
    num,
    LEAD(num) OVER(ORDER BY id) Lead
FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM CTE
WHERE Lag=num AND Lead=num