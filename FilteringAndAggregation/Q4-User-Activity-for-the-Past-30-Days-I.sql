-- Write your PostgreSQL query statement below

SELECT activity_date as day,count(distinct user_id) as active_users
FROM Activity a
WHERE activity_date between '2019-06-28 00:00:00' and '2019-07-27 23:59:59'
Group by activity_date


 

[A[[