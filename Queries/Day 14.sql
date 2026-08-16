use 50_Days_SQL_Challenge;

---1. List employees earning more than the department average salary.

SELECT
    e1.emp_id,
    e1.emp_name,
    d.dept_name,
    s1.salary
FROM cleaned_employees e1
JOIN cleaned_salary s1
    ON e1.emp_id = s1.emp_id
JOIN cleaned_department d
    ON e1.dept_id = d.dept_id
WHERE s1.salary >
(
    SELECT AVG(s.salary)
    FROM cleaned_salary s
    JOIN cleaned_employees e
        ON s.emp_id = e.emp_id
    WHERE e.dept_id = e1.dept_id
);


---2. List employees whose salary is equal to the highest salary in their department

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
WHERE s.salary =
(
    SELECT MAX(s1.salary)
    FROM cleaned_salary s1
    JOIN cleaned_employees e1
        ON s1.emp_id = e1.emp_id
    WHERE e1.dept_id = e.dept_id
);


---3. List employees whose salary is equal to the lowest salary in their department

SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
WHERE s.salary =
(
    SELECT MIN(s1.salary)
    FROM cleaned_salary s1
    JOIN cleaned_employees e1
        ON s1.emp_id = e1.emp_id
    WHERE e1.dept_id = e.dept_id
);
