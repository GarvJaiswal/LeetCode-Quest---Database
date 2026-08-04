-- -- Write your PostgreSQL query statement below

SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING 
    count(Distinct c.product_key) = 
        (
            SELECT count(*)
            FROM Product pp
        )