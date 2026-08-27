use 50_Days_SQL_Challenge;

---1. Show current salary along with next next salary for each employee 

SELECT emp_id, salary, salary_date, 

lead(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As next_salary
FROM cleaned_salary;


---2. Compare current salary with next salary for growth analysis

SELECT emp_id, salary, salary_date, 

lead(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As next_salary,
salary - lead(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As growth_analysis
FROM cleaned_salary;

---3. Predict attendance trend by comparing current and next status

SELECT emp_id, 
attendance_date, 
status AS current_status,
Lead(status) OVER (PARTITION BY emp_id ORDER BY attendance_date ASC) AS next_status
FROM cleaned_attendance;







