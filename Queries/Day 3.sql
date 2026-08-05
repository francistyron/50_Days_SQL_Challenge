use 50_days_sql_challenge;

update cleaned_employees
set emp_name = 'Unknown'
WHERE 
emp_name is NULL or emp_name = '';


update cleaned_employees
set age = 'Unknown'
WHERE 
age is NULL or age = '';


update cleaned_employees
set city = 'Delhi'
WHERE 
city is NULL or city = '';


update cleaned_performance
set rating_2023 = '0'
WHERE 
rating_2023 is NULL or rating_2023 = '';



select dept_id, dept_name, count (*)
from cleaned_department
group by dept_id, dept_name
having count (*)>1;


select emp_id, attendance_date, status, count (*)
from cleaned_attendance
group by emp_id, attendance_date, status
having count (*)>1;


select emp_name, city, hire_date, count(*)
from cleaned_employees
group by emp_name, city, hire_date
having count(*)>1;


select rating_2022, rating_2023, rating_2024, count(*)
from cleaned_performance
group by rating_2022, rating_2023, rating_2024
having count(*)>1;


select emp_id, salary, salary_date, count(*)
from cleaned_salary
group by emp_id, salary, salary_date
having count(*)>1;