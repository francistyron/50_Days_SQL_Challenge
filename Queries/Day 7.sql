use 50_Days_SQL_Challenge;

----1. remove month (invalid)

UPDATE cleaned_employees
set hire_date = NULL
where 
cAST(SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date, '-', 2) , '-' , -1) as UNSIGNED) > 12;


.....2. convert DD-MM-YYYY TO YYYY-MM-DD

UPDATE cleaned_employees 

set hire_date = CONCAT 
(RIGHT(hire_date,4), '-' , substring(hire_date, 4,2), '-', Left(hire_date,2))

where hire_date like '__-__-____';



....3. remove invalid day


update cleaned_employees
set hire_date = NULL

where cast (right(hire_date,2) as unsigned) > 31;


Alter table cleaned_employees
modify hire_date date;

select DISTINCT hire_date from cleaned_employees;

....4. replace null and empty values with - 2024-02-25


UPDATE cleaned_employees
SET hire_date = '2024-02-25'
WHERE hire_date IS NULL;


SELECT DISTINCT hire_date
FROM cleaned_employees;


....1. cleaned_salaries table

UPDATE cleaned_salary
set salary_date = NULL
where 
cAST(SUBSTRING_INDEX(SUBSTRING_INDEX(salary_date, '-', 2) , '-' , -1) as UNSIGNED) > 12;



UPDATE cleaned_salary 

set salary_date = CONCAT 
(RIGHT(salary_date,4), '-' , substring(salary_date, 4,2), '-', Left(salary_date,2))

where salary_date like '__-__-____';


update cleaned_salary
set salary_date = NULL

where cast (right(salary_date,2) as unsigned) > 31;


Alter table cleaned_salary
modify salary_date date;

select DISTINCT salary_date from cleaned_salary;


update cleaned_salary
set salary_date = '2024-02-25'
where salary_date is NULL;


....2. cleaned_attendance table


UPDATE cleaned_attendance
set attendance_date = NULL
where 
cAST(SUBSTRING_INDEX(SUBSTRING_INDEX(attendance_date, '-', 2) , '-' , -1) as UNSIGNED) > 12;



UPDATE cleaned_attendance 

set attendance_date = CONCAT 
(RIGHT(attendance_date,4), '-' , substring(attendance_date, 4,2), '-', Left(attendance_date,2))

where attendance_date like '__-__-____';




update cleaned_attendance
set attendance_date = NULL

where cast (right(attendance_date,2) as unsigned) > 31;



Alter table cleaned_attendance
modify attendance_date date;

select DISTINCT attendance_date from cleaned_attendance;


update cleaned_attendance
set attendance_date = '2024-02-25'
where attendance_date is NULL;


