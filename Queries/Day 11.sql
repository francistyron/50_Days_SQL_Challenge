use 50_Days_SQL_Challenge; 

---1. What is the employee name, department, performance rating?


SELECT 
    e.emp_name,
    e.emp_id,
    d.dept_name,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
FROM cleaned_employees e
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
JOIN cleaned_performance p
    ON e.emp_id = p.emp_id;


---2. What is the complete profile of each employee(department, salary, performance)

SELECT 
    e.emp_name,
    e.emp_id,
    d.dept_name,
    s.salary,
    p.rating_2022,
    p.rating_2023,
    p.rating_2024
FROM cleaned_employees e
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
JOIN cleaned_performance p
    ON e.emp_id = p.emp_id;

---3. How many salary records does each employee have?

SELECT 
    e.emp_name,
    e.emp_id,
    COUNT(s.salary_id) as total_salary_records
FROM cleaned_employees e
LEFT JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_name, e.emp_id;


---.4. What is total salary paid to each employee?

SELECT 
    e.emp_name,
    e.emp_id,
    SUM(s.salary) as total_salary
FROM cleaned_employees e
LEFT JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_name, e.emp_id;




