use 50_Days_SQL_Challenge;

ALTER TABLE cleaned_salary
modify salary int;


select 
min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary

from cleaned_salary
where salary >0;



ALTER TABLE cleaned_salary
ADD COLUMN is_outlier int;


UPDATE cleaned_salary
set is_outlier = 
case 
when salary < 20000 or salary > 200000
then 1
else 0
end;


SELECT * FROM cleaned_salary
where is_outlier = 1;

UPDATE cleaned_salary
set salary = 
case
when emp_id = 35 then 65000
when emp_id = 262 then 97000
else salary
end 
where salary >0;