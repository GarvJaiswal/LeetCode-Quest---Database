-- Write your PostgreSQL query statement below



;with cte as(
    SELECT name,salary,id
    from Employee 
)
SELECT e.name AS Employee
FROM Employee e 
LEFT JOIN cte c 
on e.managerId = c.id
Where e.salary > c.salary

