-- Write your PostgreSQL query statement below
;WITH FirstYear As(
    SELECT 
    DISTINCT product_id,
    MIN(year) OVER(PARTITION BY product_id) first_year
    FROM Sales
    GROUP BY product_id,year
)
SELECT 
    s.product_id,
    f.first_year,
    s.quantity,
    s.price
FROM Sales s
INNER JOIN FirstYear f
ON s.product_id=f.product_id
    AND s.year=f.first_year