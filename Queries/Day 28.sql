use 50_Days_SQL_Challenge;


---1. Find top 2 highest paid employees in each
department 

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
WHERE salary_rank <= 2
ORDER BY dept_id, salary_rank;


---2. Calculate salary gap (difference between current salary and
previous salary) 

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
    ) AS salary_gap

FROM cleaned_salary;


---3. Calculate performance gap (change in performance
between years) 

SELECT
    emp_id,
    rating_2022,
    rating_2023,
    rating_2024,

    rating_2023 - rating_2022 AS performance_gap_2022_2023,

    rating_2024 - rating_2023 AS performance_gap_2023_2024

FROM cleaned_performance;


---4. Filter only top performers based on ranking

WITH performance_ranking AS (
    SELECT
        e.emp_id,
        e.emp_name,
        p.rating_2022,
        p.rating_2023,
        p.rating_2024,

        (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3
            AS average_rating,

        RANK() OVER (
            ORDER BY
                (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 DESC
        ) AS performance_rank

    FROM cleaned_employees e
    JOIN cleaned_performance p
        ON e.emp_id = p.emp_id
)

SELECT
    emp_id,
    emp_name,
    average_rating,
    performance_rank
FROM performance_ranking
WHERE performance_rank <= 3
ORDER BY performance_rank;


