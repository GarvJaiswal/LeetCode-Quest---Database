-- -- Write your PostgreSQL query statement below

SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    Count(e.subject_name) as attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON e.student_id=s.student_id
AND e.subject_name = sub.subject_name
GROUP BY s.student_id,s.student_name,sub.subject_name
order by s.student_id,s.student_name
