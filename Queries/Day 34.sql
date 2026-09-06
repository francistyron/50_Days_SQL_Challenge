use 50_Days_SQL_Challenge;



---1. Create index on emp_id to speed up employee search

CREATE INDEX idx_salary_emp_id
ON cleaned_salary(emp_id);

SELECT *
FROM cleaned_salary
WHERE emp_id = 10;



SHOW INDEX FROM cleaned_salary;

---2. Create index on dept_id for faster department-based filtering

CREATE INDEX idx_employee_dept_id
ON cleaned_employees(dept_id);


SELECT *
FROM cleaned_employees
WHERE dept_id = 3;


SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM cleaned_employees AS e
JOIN cleaned_department AS d
    ON e.dept_id = d.dept_id;


---3. Create composite index on (emp_id, salary_date) for optimized multi-column queries

CREATE INDEX idx_salary_emp_date
ON cleaned_salary(emp_id, salary_date);


SELECT
    emp_id,
    salary,
    salary_date
FROM cleaned_salary
WHERE emp_id = 10
AND salary_date >= '2024-01-01';


