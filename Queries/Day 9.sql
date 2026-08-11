use 50_Days_SQL_Challenge;

...1.Find employees who have valid department

select e.emp_id, e.emp_name,d.dept_name
from cleaned_employees e 
join cleaned_department d 
on e.dept_id = d.dept_id;

...2.Find all employees even w/o department

select e.emp_id, e.emp_name,d.dept_name
from cleaned_employees e 
left join cleaned_department d 
on e.dept_id = d.dept_id;

...3. List employees w/o dept

select e.emp_id, e.emp_name,d.dept_name
from cleaned_employees e 
left join cleaned_department d 
on e.dept_id = d.dept_id
where dept_name is null;


...3. Find who earns how much


select e.emp_id, e.emp_name, s.salary
from cleaned_employees e 
join cleaned_salary s 
on e.emp_id = s.emp_id;



...4. Show list of employees were salary is NULL


select e.emp_id, e.emp_name, s.salary
from cleaned_employees e 
join cleaned_salary s 
on e.emp_id = s.emp_id
where salary is null;


