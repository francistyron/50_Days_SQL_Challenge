use 50_Days_SQL_Challenge;

---1. List employees whose average performance rating is greater than 4

SELECT
e.emp_id,
e.emp_name,
d.dept_name,
(p.rating_2022 + p.rating_2023 + p.rating_2024)/3 As average_performance_rating
FROM cleaned_employees e 
JOIN cleaned_department d 
ON e.dept_id = d.dept_id
JOIN cleaned_performance p 
ON e.emp_id = p.emp_id
WHERE (p.rating_2022 + p.rating_2023 + p.rating_2024)/3 > 4;


---2. List employees with more than 2 present days

SELECT
e.emp_id,
e.emp_name,
COUNT(a.attendance_id) AS present_days
FROM cleaned_employees e 
JOIN cleaned_attendance a 
ON e.emp_id = a.emp_id
WHERE a.status = 'Present'
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(a.attendance_id) >2;


---3. List departments where total salary paid is greater than 200000

SELECT
d.dept_id,
d.dept_name,
SUM(s.salary_id) AS total_salary
FROM cleaned_department d 
JOIN cleaned_employees e 
ON d.dept_id = e.dept_id
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY d.dept_id, d.dept_name
HAVING SUM(s.salary) > 200000;


---4. List employees whose total salary is greater than their department average salary

SELECT
    e1.emp_id,
    e1.emp_name,
    d.dept_name,
    s1.salary
FROM cleaned_employees AS e1
JOIN cleaned_salary AS s1
    ON e1.emp_id = s1.emp_id
JOIN cleaned_department AS d
    ON e1.dept_id = d.dept_id
WHERE s1.salary >
(
    SELECT AVG(s.salary)
    FROM cleaned_salary AS s
    JOIN cleaned_employees AS e
        ON s.emp_id = e.emp_id
    WHERE e.dept_id = e1.dept_id
);