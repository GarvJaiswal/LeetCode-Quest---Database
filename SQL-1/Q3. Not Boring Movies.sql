-- Write your PostgreSQL query statement below
SELECT id,movie,description,rating
FROM Cinema c 
WHERE id%2=1 AND
description <> 'boring'
ORDER BY rating DESC;