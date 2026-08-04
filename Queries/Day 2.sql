use 50_Days_SQL_Challenge;

create table cleaned_department
as
select * from department;


create table cleaned_employees
as
select * from employees;


create table cleaned_salary
as
select * from salary;


create table cleaned_attendance
as
select * from attendance;


create table cleaned_performance
as
select * from performance;



select * from cleaned_department
WHERE
dept_id is NULL or dept_id = ''
or 
dept_name is NULL or dept_name = '';



select * from cleaned_employees
WHERE
emp_id is NULL or emp_id = ''
or
emp_name is NULL or emp_name = ''
or 
age is NULL or age = ''
or 
city is NULL or city = ''
or 
dept_id is NULL or dept_id = ''
or 
hire_date is NULL or hire_date = '';



select * from cleaned_salary
WHERE
salary_id is NULL or salary_id = ''
OR
emp_id is NULL or emp_id = ''
OR
salary is NULL or salary = ''
OR
salary_date is NULL or salary_date = '';



select * from cleaned_attendance
WHERE
attendance_id is NULL or attendance_id = ''
OR
emp_id is NULL or emp_id = ''
OR
attendance_date is NULL or attendance_date = ''
OR
status is NULL or status = '';



select * from cleaned_performance
WHERE
emp_id is NULL or emp_id = ''
OR
rating_2022 is NULL or rating_2022 = ''
OR
rating_2023 is NULL or rating_2023 = ''
OR
rating_2024 is NULL or rating_2024 = '';

