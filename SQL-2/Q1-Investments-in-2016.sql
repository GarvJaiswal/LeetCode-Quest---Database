-- Write your PostgreSQL query statement below
;WITH Repeated2015 AS(
    SELECT tiv_2015,COUNT(1)
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(1)>1
)
,UniqueLocation AS(
    SELECT lat,lon,COUNT(1)
    FROM Insurance
    GROUP BY lat,lon
    HAVING COUNT(1)=1
)
SELECT 
    ROUND(SUM(CAST(i.tiv_2016 as numeric)),2) AS tiv_2016
FROM Insurance i
INNER JOIN Repeated2015 r
ON i.tiv_2015=r.tiv_2015
INNER JOIN UniqueLocation u
ON i.lat=u.lat AND i.lon=u.lon