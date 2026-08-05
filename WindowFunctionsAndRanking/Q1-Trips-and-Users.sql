-- Write your PostgreSQL query statement below
; with CTE as
(SELECT
    COUNT(DISTINCT t.id) AS unbanned_count,
    COUNT(DISTINCT CASE 
        WHEN t.status='cancelled_by_driver'
            OR t.status='cancelled_by_client'
        THEN t.id END) AS cancelled_count,    
    t.request_at AS Day
FROM Trips t
LEFT JOIN Users client
ON t.client_id=client.users_id
LEFT JOIN Users driver
ON t.driver_id=driver.users_id
WHERE t.request_at >='2013-10-01' 
    AND t.request_at <='2013-10-03'
    AND client.banned ='No'
    AND driver.banned ='No'
GROUP BY t.request_at
)
SELECT Day,ROUND(CAST(cancelled_count as numeric)/unbanned_count,2) AS "Cancellation Rate"
FROM CTE