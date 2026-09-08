Use 50_Days_SQL_Challenge;

---1. Create a procedure to get all employee data

Create Procedure get_all_emp()
Begin 
select * from cleaned_employees;
end;

-- Execute and Fetch Results

call  get_all_emp();


---2. Create a procedure with input parameter to find employee
by emp_id

-- Create the Procedure

Create Procedure get_emp_by_id(IN emp_id_input INT)
Begin 
Select * from cleaned_employees 
WHERE emp_id = emp_id_input;
end;

-- Execute and Fetch Results

call get_emp_by_id(101);


---3. Create a procedure using JOIN to fetch employee and salary details

-- Create the Procedure

Create Procedure get_employee_salary()
Begin 
select 
        e.emp_id,
        e.emp_name,
        e.age,
        e.city,
        e.dept_id,
        e.hire_date,
        s.salary_id,
        s.emp_id,
        s.salary,
        s.salary_date
from cleaned_employees e
join cleaned_salary s 
on e.emp_id = s.emp_id;
end;


-- Execute and Fetch Results


call get_employee_salary();


---4. Create a procedure for salary report (employees with salary > 50000)

-- Create the Procedure


Create Procedure get_high_salary()
Begin 
select 
        e.emp_id,
        e.emp_name,
        e.age,
        e.hire_date,
        s.salary
from cleaned_employees e
join cleaned_salary s 
on e.emp_id = s.emp_id
WHERE s.salary>50000;
end;

-- Execute and Fetch Results

call get_high_salary();









