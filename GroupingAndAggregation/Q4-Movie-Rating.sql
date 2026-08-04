-- Write your PostgreSQL query statement below

;with UserCountRating As(
    SELECT 
        u.user_id,
        u.name,
        count(rating) NumRating
    FROM Users u
    INNER JOIN MovieRating mr
    ON u.user_id = mr.user_id
    GROUP BY u.user_id,u.name
    ORDER BY NumRating DESC,u.name ASC
    LIMIT 1
), MovieMostRated As(
    SELECT m.movie_id,m.title,AVG(rating) Avg
    FROM Users u
    INNER JOIN MovieRating mr
    ON u.user_id = mr.user_id
    INNER JOIN Movies m
    ON m.movie_id=mr.movie_id
    WHERE mr.created_at between '2020-02-01 00:00:00' AND '2020-02-29 23:59:59'
    GROUP BY m.movie_id,m.title
    ORDER BY Avg DESC,m.title ASC
    LIMIT 1
)
SELECT name results
FROM UserCountRating
UNION ALL
SELECT title results
FROM MovieMostRated




