use 50_Days_SQL_Challenge;

---1. Calculate total salary paid to each employee

SELECT
e.emp_id,
e.emp_name,
SUM(s.salary) as total_salary
FROM cleaned_employees e 
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;


---2. Calculate average salary of each employee

SELECT
e.emp_id,
e.emp_name,
AVG(s.salary) as average_salary
FROM cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;


---3. Count number of salary records for each employee

SELECT
e.emp_id,
e.emp_name,
COUNT(s.salary_id) as salary_records
FROM cleaned_employees e
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;


---4. Find maximum salary recieved by each employee

SELECT
e.emp_id,
e.emp_name,
MAX(s.salary) as maximum_salary
FROM cleaned_employees e
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;




