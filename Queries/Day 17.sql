use 50_Days_SQL_Challenge;

---1. List employees with more than 2 salary records

SELECT
e.emp_id,
e.emp_name,
COUNT(s.salary_id) As salary_records
FROM cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT()


---2. List departments with more than 3 employees

SELECT
d.dept_id,
d.dept_name,
COUNT(e.emp_id) As employee_count
FROM cleaned_department d 
JOIN cleaned_employees e 
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 3;


---3. List employees with total salary greater than 100000

SELECT
e.emp_id,
e.emp_name,
SUM(s.salary) As total_salary
FROM cleaned_employees e
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING SUM(s.salary) > 100000;

---4. List departments with high average salary (greater than 50000)

SELECT
d.dept_id,
d.dept_name,
AVG(s.salary) As average_salary
FROM cleaned_department d 
JOIN cleaned_employees e
ON d.dept_id = e.dept_id
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY d.dept_id, d.dept_name
HAVING AVG(s.salary) > 50000;



