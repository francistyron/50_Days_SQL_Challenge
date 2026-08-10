use 50_Days_SQL_Challenge;

UPDATE cleaned_employees
set emp_name = TRIM(emp_name);

---Data type conversion

ALTER table cleaned_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;


DESCRIBE cleaned_employees;

Alter table cleaned_department
modify dept_id int,
modify dept_name varchar(100);

DESCRIBE cleaned_department;


ALTER table cleaned_attendance
modify attendance_id int,
modify emp_id int,
modify attendance_date date,
modify status varchar(50);

DESCRIBE cleaned_attendance;

ALTER table cleaned_salary
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date,
modify is_outlier int;



ALTER table cleaned_performance
modify emp_id int,
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int;


