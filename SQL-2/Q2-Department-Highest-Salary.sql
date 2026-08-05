-- Write your PostgreSQL query statement below
WITH CTE AS(
    SELECT 
        departmentId,
        salary,
        ROW_NUMBER() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rank
    FROM Employee e
)
SELECT 
    d.name AS Department,
    e.name as Employee,
    c.salary as Salary
FROM Employee e
INNER JOIN Department d
ON e.departmentId = d.id
INNER JOIN CTE c
ON c.departmentId = d.id and e.salary = c.salary
WHERE c.rank=1