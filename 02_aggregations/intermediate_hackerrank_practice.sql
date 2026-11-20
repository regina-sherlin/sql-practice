SELECT 
s.student_id, s.name
FROM Students s 
LEFT JOIN Enrollments e 
    on s.student_id = e.student_id
WHERE e.enrollment_id IS NULL
ORDER BY s.student_id ASC;

-- SELECT s.student_id, s.name, count(e.enrollment_id) as total_courses
-- FROM Students s 
-- left join Enrollments e 
-- 	ON s.student_id = e.student_id
--     and e.semester = 'Fall 2026'
-- group by s.student_id, s.name
-- order by count(e.enrollment_id) desc, s.student_id asc;    
-- Find the student_id and name of students who have earned an 'A' grade in at least 2 different courses worth 4 credits each.

-- SELECT s.student_id, s.name, c.course_id
-- FROM Students s 
-- JOIN Enrollments e 
-- 	on s.student_id = e.student_id
--     AND e.grade = 'A'
-- JOIN Courses c 
-- 	on e.course_id = c.course_id
--     and c.credits = 4
-- group by s.student_id, s.name
-- having count(DISTINCT c.course_id) >=2

--  Find the student_id and name of all students who have never enrolled in a 
--  'Computer Science' or 'Database Systems' course (specifically, courses where title = 'Database Systems'), even if they enrolled in other courses


-- SELECT s.student_id, s.name, c.title
-- FROM Students s 
-- LEFT JOIN Enrollments e 
-- 	on s.student_id = e.student_id
-- LEFT JOIN Courses c 
-- 	on e.course_id = c.course_id
-- WHERE c.title IS NOT NULL
-- GROUP BY s.student_id, s.name
-- having c.title != 'Database Systems'





--  For every student, return their student_id, name, their total number of enrollments 
--  (total_enrollments), and the total amount of 'Paid' payments they have made (total_paid, showing 0 if none).

-- with total_enrollments as (
-- SELECT 
-- 	student_id,
-- 	COUNT(enrollment_id) as total_enroll
-- from Enrollments
-- GROUP by student_id),
-- total_paid as (
-- 	SELECT student_id
--     , sum(amount) as total_paid
--   	FROM Payments 
--   	WHERE status = 'Paid'
--     GROUP by student_id
    
-- )
-- SELECT s.student_id, s.name
-- , coalesce(t.total_enroll,0)
-- , coalesce(p.total_paid,0)
-- FROM Students s 
-- left JOIN total_enrollments t 
-- 	ON s.student_id = t.student_id
-- left JOIN total_paid p 
-- 	on s.student_id = p.student_id
-- order by s.student_id asc;


-- SELECT a.city,
-- 	a.name as mentor_1,
--     b.name as mentor_2
-- from mentors a 
-- join mentors b 
-- 	on a.city = b.city
--     and a.mentor_id < b.mentor_id


-- Write a query on daily_steps to find the day numbers (day_num) where the user walked more steps than on the day immediately before it.
-- • Columns needed: day_num, today_steps, yesterday_steps

-- SELECT 
--     curr.day_num,
--     curr.steps as today_steps,
--     prev.steps as yesterday_steps
-- FROM daily_steps prev 
-- join daily_steps curr 
-- 	on curr.day_num = prev.day_num + 1
-- 	and curr.steps > prev.steps

-- Write a query on mentors to find any mentor who has more years of experience (experience_yrs) than the senior mentor they report to.
-- • Columns needed: mentor_name, mentor_exp, senior_name, senior_exp

-- SELECT 
-- 	m1.name as mentor_name,
--     m1.experience_yrs as mentor_exp,
--     m2.name as senior_name,
--     m2.experience_yrs as senior_exp
-- FROM mentors m1 
-- JOIN mentors m2 
-- 	on m1.senior_mentor_id = m2.mentor_id
--     and m1.experience_yrs > m2.experience_yrs

-- Write a query on doctor_appointments to find double-booked appointments where the same doctor is scheduled for two overlapping time slots.
-- • Columns needed: doctor_name, appt_1, appt_2

-- SELECT * from doctor_appointments;

-- SELECT 
-- 	a.doctor_name,
--     a.appt_id as appt_1,
--     b.appt_id as appt_2
-- from doctor_appointments a 
-- JOIN doctor_appointments b 
-- 	on a.doctor_name = b.doctor_name
--     and a.appt_id < b.appt_id
--     and a.start_hr < b.end_hr
--     and a.end_hr > b.start_hr


-- select * from mentors;

-- Write a query on mentors to count how many unique pairs of mentors share the same city in each city.
-- • Columns needed: city, mentor_pairs

-- SELECT a.city,
-- count(a.city) as mentor_pairs
-- from mentors a 
-- join mentors b
-- 	on a.city = b.city
--     and a.mentor_id < b.mentor_id
-- GROUP by a.city

-- write a query to find unique pairs of cities that have direct flights in both directions (origin -> destination AND destination -> origin).

-- SELECT a.origin, 
-- a.destination,
-- b.origin,
-- b.destination
-- from flights a 
-- join flights b 
-- 	on a.origin = b.destination 
--     and a.destination = b.origin
--     and a.origin < b.origin
-- Write a query on coordinates to return all valid symmetric pairs where x <= y, ordered by x ascending: 

SELECT * FROM coordinates;

SELECT a.x, a.y
from coordinates a 
JOIN coordinates b 
	on a.x = b.y
    and a.y = b.x
    and a.x < b.x
    















