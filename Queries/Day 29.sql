use 50_Days_SQL_Challenge;


---1. Find latest salary per employee along with total
salary till that point

WITH salary_history AS (
    SELECT
        emp_id,
        salary,
        salary_date,

        SUM(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date ASC
        ) AS total_salary_till_point,

        ROW_NUMBER() OVER (
            PARTITION BY emp_id
            ORDER BY salary_date DESC
        ) AS latest_rank

    FROM cleaned_salary
)

SELECT
    emp_id,
    salary,
    salary_date,
    total_salary_till_point
FROM salary_history
WHERE latest_rank = 1;



---2. Rank employees based on salary and compare with
department average salary

WITH employee_salary AS (
    SELECT
        e.emp_id,
        e.emp_name,
        e.dept_id,
        s.salary,

        AVG(s.salary) OVER (
            PARTITION BY e.dept_id
        ) AS dept_avg_salary,

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
    dept_avg_salary,
    salary_rank,

    CASE
        WHEN salary > dept_avg_salary THEN 'Above Average'
        WHEN salary < dept_avg_salary THEN 'Below Average'
        ELSE 'Equal'
    END AS salary_comparison

FROM employee_salary
ORDER BY dept_id, salary_rank;


---3. Check whether salary has increased or decreased
compared to previous record


SELECT
    emp_id,
    salary_date,
    salary,

    LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date ASC
    ) AS previous_salary,

    salary - LAG(salary) OVER (
        PARTITION BY emp_id
        ORDER BY salary_date ASC
    ) AS salary_change,

    CASE
        WHEN LAG(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date ASC
        ) IS NULL
            THEN 'First Record'

        WHEN salary > LAG(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date ASC
        )
            THEN 'Increased'

        WHEN salary < LAG(salary) OVER (
            PARTITION BY emp_id
            ORDER BY salary_date ASC
        )
            THEN 'Decreased'

        ELSE 'No Change'
    END AS salary_trend

FROM cleaned_salary
ORDER BY emp_id, salary_date;


