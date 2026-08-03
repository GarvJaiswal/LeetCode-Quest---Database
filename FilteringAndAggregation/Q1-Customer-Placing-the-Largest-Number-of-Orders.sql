-- Write your PostgreSQL query statement below
Select customer_number
FROM Orders
Group by customer_number
Order by count(1) DESC
LIMIT 1