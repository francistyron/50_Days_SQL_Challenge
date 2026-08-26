use 50_Days_SQL_Challenge;

---1.Show current salary along with previous salary for each employee

SELECT emp_id, salary, salary_date, 

lag(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As pre_salary
FROM cleaned_salary;

---2. Calculate difference between current salary and previous salary

SELECT emp_id, salary, salary_date, 

lag(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As pre_salary,
salary - lag(salary) OVER(PARTITION BY emp_id ORDER BY salary_date ASC) As salary_change
FROM cleaned_salary;


---3. Analyze attendance trend (compare current status with previous status)

SELECT emp_id, 
attendance_date, 
status AS current_status,
LAG(status) OVER (PARTITION BY emp_id ORDER BY attendance_date ASC) AS previous_status
FROM cleaned_attendance;
