-- Write your PostgreSQL query statement below

SELECT class
FROM Courses
GROUP by class
HAVING count(1)>=5