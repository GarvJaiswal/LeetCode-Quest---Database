-- Write your PostgreSQL query statement below
WITH lead_and_lag  AS (
    SELECT id, visit_date, people,
    LAG(people, 2) OVER( ORDER BY id) AS prev2people,
    LAG(people, 1) OVER( ORDER BY id) AS prev1people,
    LEAD(people, 1) OVER( ORDER BY id) AS next1people,
    LEAD(people, 2) OVER( ORDER BY id) AS next2people
    FROM Stadium
)
SELECT 
    id, 
    visit_date,
    people
FROM lead_and_lag
WHERE people >= 100 AND
    (
        (prev2people >= 100 AND prev1people >= 100) 
        OR 
        (next1people >= 100 AND next2people >= 100) 
        OR
        (prev1people >= 100 AND next1people >= 100)) 
ORDER BY visit_date