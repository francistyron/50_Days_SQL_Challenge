use 50_Days_SQL_Challenge;

---1. Find rank of employees within each department based on salary

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY s.salary DESC
    ) AS dept_salary_rank
FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id;


---2. Compare each employee’s salary with their department average (Above Avg / Below Avg / Equal) 

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    AVG(s.salary) OVER (
        PARTITION BY e.dept_id
    ) AS dept_avg_salary,

    CASE
        WHEN s.salary > AVG(s.salary) OVER (
            PARTITION BY e.dept_id
        ) THEN 'Above Avg'

        WHEN s.salary < AVG(s.salary) OVER (
            PARTITION BY e.dept_id
        ) THEN 'Below Avg'

        ELSE 'Equal'
    END AS salary_comparison

FROM cleaned_employees e
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id;


---3. Find top 3 highest paid employees in each department 

WITH ranked_employees AS (
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        RANK() OVER (
            PARTITION BY e.dept_id
            ORDER BY s.salary DESC
        ) AS salary_rank
    FROM cleaned_employees e
    JOIN cleaned_salary s
        ON e.emp_id = s.emp_id
)

SELECT
    emp_id,
    emp_name,
    dept_id,
    salary,
    salary_rank
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY dept_id, salary_rank;


---4. Find lowest salary employee in each department

WITH ranked_employees AS (
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,
        RANK() OVER (
            PARTITION BY e.dept_id
            ORDER BY s.salary ASC
        ) AS salary_rank
    FROM cleaned_employees e
    JOIN cleaned_salary s
        ON e.emp_id = s.emp_id
)

SELECT
    emp_id,
    emp_name,
    dept_id,
    salary
FROM ranked_employees
WHERE salary_rank = 1
ORDER BY dept_id;
