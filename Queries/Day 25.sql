use 50_Days_SQL_Challenge;


---1. Calculate running total (cumulative salary for each employee over time)

SELECT emp_id, salary, salary_date,
SUM(salary) over(PARTITION BY emp_id ORDER BY salary_date) As running_total
FROM cleaned_salary; 

---2. Calculate running (find total attendance count for each employee)

SELECT emp_id, attendance_date, status, 
COUNT(*) over(PARTITION BY emp_id ORDER BY attendance_date ASC) As running_attendance_count
FROM cleaned_attendance;

---3. Calculate cumulative salary for each department over time

SELECT e.dept_id, s.emp_id, s.salary, s.salary_date,
SUM(s.salary) OVER (PARTITION BY e.dept_id ORDER BY s.salary_date ASC) AS dept_cumulative_salary
FROM cleaned_employees e
JOIN cleaned_salary s
ON e.emp_id = s.emp_id;


