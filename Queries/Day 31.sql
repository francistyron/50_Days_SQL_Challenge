use 50_Days_SQL_Challenge;


---1. Find employees whose total salary is greater
than 100000

SELECT
    e.emp_id,
    e.emp_name,
    SUM(s.salary) AS total_salary
FROM cleaned_employees AS e
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
HAVING SUM(s.salary) > 100000;


---2. Show employee salary along with department average
salary using CTE

WITH department_average AS (
    SELECT
        e.dept_id,
        AVG(s.salary) AS dept_avg_salary
    FROM cleaned_employees AS e
    JOIN cleaned_salary AS s
        ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    da.dept_avg_salary
FROM cleaned_employees AS e
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id
JOIN department_average AS da
    ON e.dept_id = da.dept_id;


---3. Find department with highest total salary

SELECT
    d.dept_id,
    d.dept_name,
    SUM(s.salary) AS total_salary
FROM cleaned_department AS d
JOIN cleaned_employees AS e
    ON d.dept_id = e.dept_id
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id
GROUP BY
    d.dept_id,
    d.dept_name
ORDER BY total_salary DESC
LIMIT 1;

