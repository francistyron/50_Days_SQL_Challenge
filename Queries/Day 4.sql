use 50_Days_SQL_Challenge;

with cte as (
select * , row_number () over (PARTITION BY emp_name, city, hire_date
ORDER BY emp_name) as rn 
from cleaned_employees)

DELETE from cleaned_employees
where emp_name in
(select emp_name from cte where rn>1);


with cte as (
select * ,row_number () over (PARTITION BY emp_id, salary, salary_date
order by emp_id) as rn
from cleaned_salary 
)

delete from cleaned_salary
where emp_id in 
(select emp_id from cte where rn>1);



with cte as (
    select * , row_number () OVER (PARTITION BY rating_2022, rating_2023, rating_2024
    ORDER BY rating_2022) as rn
    from cleaned_performance
)

DELETE from cleaned_performance 
where rating_2022 in 
(
    select rating_2022 from cte where rn>1
);



select DISTINCT city 
from cleaned_employees;

UPDATE cleaned_employees
SET city = CONCAT(UPPER(LEFT(TRIM(CITY),1)),
Lower(substring(trim(city),2)));



UPDATE cleaned_employees
SET city = case 
when city in ('New delhi') then 'Delhi'
when city in ('Hydbd') then 'Hyderabad'
when city in ('Bangalore') then 'Bengaluru'
else city
end;