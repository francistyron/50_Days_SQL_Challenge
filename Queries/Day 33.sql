use 50_Days_SQL_Challenge;



---1. Update employee data using a view 

CREATE VIEW employee_update_view AS
SELECT
    emp_id,
    emp_name,
    dept_id,
    hire_date
FROM cleaned_employees;

UPDATE employee_update_view
SET emp_name = 'John Smith'
WHERE emp_id = 1;

SELECT *
FROM employee_update_view
WHERE emp_id = 1;

---2. Create view for high salary employees (salary > 50000) and fetch data from it

CREATE VIEW high_salary_employees AS
SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    s.salary_date
FROM cleaned_employees AS e
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id
WHERE s.salary > 50000;

SELECT *
FROM high_salary_employees
ORDER BY salary DESC;


---3. Create multi-table view combining employee, department, and salary

CREATE VIEW employee_department_salary AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_id,
    d.dept_name,
    s.salary,
    s.salary_date
FROM cleaned_employees AS e
JOIN cleaned_department AS d
    ON e.dept_id = d.dept_id
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id;

SELECT *
FROM employee_department_salary;


---4. Create HR dashboard view for high salary employees with department
name

CREATE VIEW hr_high_salary_dashboard AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.salary,
    s.salary_date
FROM cleaned_employees AS e
JOIN cleaned_department AS d
    ON e.dept_id = d.dept_id
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id
WHERE s.salary > 50000;

SELECT *
FROM hr_high_salary_dashboard
ORDER BY salary DESC;

