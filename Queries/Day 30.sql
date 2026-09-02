use 50_Days_SQL_Challenge;


---1. Create a temporary result set using CTE and filter data from it

WITH high_salary AS (
    SELECT
        emp_id,
        salary
    FROM cleaned_salary
    WHERE salary > 50000
)

SELECT
    emp_id,
    salary
FROM high_salary;


---2. Combine employees and salaries using CTE

WITH employee_salary AS (
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        s.salary_date
    FROM cleaned_employees e
    JOIN cleaned_salary s
        ON e.emp_id = s.emp_id
)

SELECT
    emp_id,
    emp_name,
    dept_id,
    salary,
    salary_date
FROM employee_salary;


---3. Find employees earning more than department average using CTE

WITH department_average AS (
    SELECT
        e.dept_id,
        AVG(s.salary) AS dept_avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salary s
        ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    da.dept_avg_salary
FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id
JOIN department_average da
    ON e.dept_id = da.dept_id
WHERE s.salary > da.dept_avg_salary;







