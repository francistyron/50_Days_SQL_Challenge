use 50_Days_SQL_Challenge;

---1.  Create employee view to store reusable employee details

CREATE VIEW employee_details AS
SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    d.dept_name,
    e.hire_date
FROM cleaned_employees AS e
LEFT JOIN cleaned_department AS d
    ON e.dept_id = d.dept_id;

---2. Create salary view to store salary-related data

CREATE VIEW salary_details AS
SELECT
    salary_id,
    emp_id,
    salary,
    salary_date,
    is_outlier
FROM cleaned_salary;


---3. Create joined view combining employee and salary details

CREATE VIEW employee_salary_details AS
SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    s.salary,
    s.salary_date,
    s.is_outlier
FROM cleaned_employees AS e
JOIN cleaned_salary AS s
    ON e.emp_id = s.emp_id;


---4. Use created view to filter employees with salary greater than
50000

SELECT
    emp_id,
    emp_name,
    dept_id,
    salary,
    salary_date
FROM employee_salary_details
WHERE salary > 50000;

