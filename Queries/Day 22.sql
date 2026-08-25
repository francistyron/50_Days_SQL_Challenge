Use 50_Days_SQL_Challenge;

---1. Show each employee with average salary of their department

SELECT e.emp_id, e.dept_id, s.salary, 
AVG(s.salary) OVER (PARTITION BY e.dept_id) As 
dept_avg_salary 
FROM cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id;

---2. Show total salary of each department for each employee

SELECT e.emp_id, e.dept_id, s.salary, 
SUM(s.salary) OVER (PARTITION BY e.dept_id) As 
dept_total_salary 
FROM cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id;

---3. Show average performance rating of each department

SELECT DISTINCT
    d.dept_id,
    d.dept_name,
    AVG(
        (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3
    ) OVER (PARTITION BY d.dept_id) AS dept_avg_rating
FROM cleaned_employees e
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
JOIN cleaned_performance p
    ON e.emp_id = p.emp_id;