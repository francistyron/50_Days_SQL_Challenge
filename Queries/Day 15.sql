Use 50_Days_SQL_Challenge;

---1. List employees with salary records (atleast one)

SELECT
e.emp_id,
e.emp_name,
s.salary_id
FROM cleaned_employees e
JOIN cleaned_salary s 
ON e.emp_id = s.emp_id
WHERE salary_id > 1;

SELECT
e.emp_id,
e.emp_name
FROM cleaned_employees e
WHERE EXISTS
(select 1 from cleaned_salary s
WHERE e.emp_id = s.emp_id);

---2. List employees without salary records

SELECT 
e.emp_id,
e.emp_name
FROM cleaned_employees e  
WHERE NOT EXISTS
(select 1 from cleaned_salary s 
WHERE e.emp_id = s.emp_id);


---3. List employees with attendance records

SELECT
e.emp_id,
e.emp_name
FROM cleaned_employees e 
WHERE EXISTS
(
    SELECT 1 from cleaned_attendance a 
    WHERE e.emp_id  = a.emp_id
);


---4. List employees without attendance records

SELECT
e.emp_id,
e.emp_name
FROM cleaned_employees e 
WHERE NOT EXISTS
(
    SELECT 1 from cleaned_attendance a 
    WHERE e.emp_id  = a.emp_id
);