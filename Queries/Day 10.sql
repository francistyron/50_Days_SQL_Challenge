use 50_Days_SQL_Challenge;

---1. Performance ratings of each employees


select e.emp_id, e.emp_name, p.rating_2022, p.rating_2023, p.rating_2024
from cleaned_employees e 
join cleaned_performance p 
on e.emp_id = p.emp_id;


---2.  which employees do not have any salary records

select e.emp_name, e.emp_id, s.salary
from cleaned_employees e 
Left join cleaned_salary s 
on e.emp_id = s.emp_id
where s.emp_id is null;


---3. Which employees do not have attendance records

select e.emp_name, e.emp_id 
from cleaned_employees e 
Left join cleaned_attendance a 
on e.emp_id = a.emp_id 
where a.emp_id is null;


---4. What is the employee name, department, salary, together

SELECT 
    e.emp_name,
    e.emp_id,
    d.dept_name,
    s.salary
FROM cleaned_employees e
JOIN cleaned_department d
    ON e.dept_id = d.dept_id
JOIN cleaned_salary s
    ON e.emp_id = s.emp_id;
