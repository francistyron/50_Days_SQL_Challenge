use 50_Days_SQL_Challenge;

---.1 Compare each employee's salary with overall
average salary (> avg → Above Avg, < avg →
Below Avg, = avg → Equal)

SELECT
    e.emp_id,
    e.emp_name,
    s.salary,
    (SELECT AVG(salary)
     FROM cleaned_salary) AS overall_avg_salary,

    CASE
        WHEN s.salary > (SELECT AVG(salary)
                         FROM cleaned_salary)
            THEN 'Above Avg'

        WHEN s.salary < (SELECT AVG(salary)
                         FROM cleaned_salary)
            THEN 'Below Avg'

        ELSE 'Equal'
    END AS salary_comparison

FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id;


---2. Compare employee salary with total salary of all employees
(salary > 10% of total salary → High Contributor, else → Low
Contributor)


SELECT
    e.emp_id,
    e.emp_name,
    s.salary,

    (SELECT SUM(salary)
     FROM cleaned_salary) AS total_salary,

    (SELECT SUM(salary)
     FROM cleaned_salary) * 0.10 AS ten_percent_total,

    CASE
        WHEN s.salary > (SELECT SUM(salary)
                         FROM cleaned_salary) * 0.10
            THEN 'High Contributor'
        ELSE 'Low Contributor'
    END AS contribution_category

FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id;



---3. Compare department total salary with overall total salary
(dept total > 30% of total → High Dept, else → Low Dept)


WITH department_salary AS (
    SELECT
        e.dept_id,
        SUM(s.salary) AS dept_total_salary
    FROM cleaned_employees e
    JOIN cleaned_salary s
        ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT
    d.dept_id,
    d.dept_name,
    ds.dept_total_salary,

    (SELECT SUM(salary)
     FROM cleaned_salary) AS overall_total_salary,

    (SELECT SUM(salary)
     FROM cleaned_salary) * 0.30 AS thirty_percent_total,

    CASE
        WHEN ds.dept_total_salary >
             (SELECT SUM(salary)
              FROM cleaned_salary) * 0.30
            THEN 'High Dept'
        ELSE 'Low Dept'
    END AS department_category

FROM department_salary ds
JOIN cleaned_department d
    ON ds.dept_id = d.dept_id;

