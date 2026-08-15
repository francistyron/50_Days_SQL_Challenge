use 50_Days_SQL_Challenge;

---1. What is the average salary in each department?

select 
d.dept_name,  
AVG(s.salary) as average_salary
from cleaned_department d 
JOIN cleaned_employees  e 
ON d.dept_id = e.dept_id 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
GROUP BY d.dept_name;


---2. How many days was each employee present.

select 
e.emp_name,
e.emp_id,
COUNT(a.attendance_id) as attendance
from cleaned_employees e 
LEFT JOIN cleaned_attendance a 
ON e.emp_id = a.emp_id
GROUP BY e.emp_name, e.emp_id;


---3. Which employee belong to the same department?

select 
dept_id,
GROUP_CONCAT(emp_name) as employee_list 
from cleaned_employees 
GROUP BY dept_id
having COUNT(*)>1;


---4. Which employee have more than 1 salary record?

select 
e.emp_id,
e.emp_name,
COUNT(s.salary_id) as salary_record
from cleaned_employees e
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
GROUP BY emp_id, emp_name
HAVING COUNT(s.salary_id)>1;

