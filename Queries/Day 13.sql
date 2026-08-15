use 50_Days_SQL_Challenge;

--1. List employees earning more than average salary

select 
e.emp_name,
e.emp_id,
s.salary
from cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id 
where salary>
(select AVG(salary) from cleaned_salary);



---2. List employees with salary equal to maximum salary

select 
e.emp_name, 
e.emp_name,
s.salary
from cleaned_employees e 
JOIN cleaned_salary s
ON e.emp_id = s.emp_id
WHERE salary = 
(select max(salary) from cleaned_salary);


---3. List employees earning less than average salary

select 
e.emp_name,
e.emp_id,
s.salary
from cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
WHERE salary <
(select avg(salary) from cleaned_salary);


---4. List employees with minimum salary

select 
e.emp_name, 
e.emp_id,
s.salary
from cleaned_employees e 
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
WHERE salary =
(select min(salary) from cleaned_salary);

