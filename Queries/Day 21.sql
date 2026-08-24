use 50_Days_SQL_Challenge;


---1. Rank employees based on salary 

SELECT emp_id, salary,
RANK() OVER(ORDER BY salary desc) As salary_rank
FROM cleaned_salary;


---2. Perform department-wise ranking of employees

SELECT e.emp_id, e.dept_id, s.salary, 
DENSE_RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary desc) AS dept_rank
FROM cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id;

---3. Identify top performaers based on average performance rating

SELECT emp_id, (rating_2022+rating_2023+rating_2024)/3 avg_rating,
DENSE_RANK() OVER(ORDER BY (rating_2022+rating_2023+rating_2024)/3 desc) AS performance_rank
FROM performance; 


---4. Fiinf top 3 employees based on salary ranking

SELECT e.emp_id, s.salary,
RANK() OVER(ORDER BY salary desc) As salary_rank
FROM cleaned_employees e 
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
WHERE salary_rank <= 3;
