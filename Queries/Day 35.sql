use 50_Days_SQL_Challenge;


---1. Analyze query performance before applying
index using EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    cleaned_employees As e
JOIN 
    cleaned_salary As s 
    ON e.emp_id = s.emp_id;

---2. Apply index on join columns and compare performance after
indexing

CREATE INDEX idx_salary ON cleaned_salary(salary)


EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    cleaned_employees e
JOIN 
    cleaned_salary s 
    ON e.emp_id =s.emp_id;


---3. Analyze query using multiple conditions (emp_id, salary_date) and
optimize using composite index 
EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    cleaned_employees e
JOIN 
    cleaned_salary s ON e.emp_id =s.emp_id
WHERE 
    e.emp_id IN (101,43,97) AND s.salary_date = '2024-01-01';

--- create a composite index on clean_salary_date and emp_id

CREATE INDEX 
    idx_emp_id_salary_date 
ON 
    cleaned_salary(emp_id, salary_date);


---

EXPLAIN ANALYZE
SELECT 
    e.emp_name,
    s.salary
FROM 
    cleaned_employees e
JOIN 
    cleaned_salary s ON e.emp_id =s.emp_id
WHERE 
    e.emp_id IN (101,43,97) AND s.salary_date = '2024-01-01';


---4. Compare query performance before and after applying index on emp_id

-- BEFORE INDEX

DROP INDEX IF EXISTS idx_salary_emp_id
ON cleaned_salary;

EXPLAIN ANALYZE
SELECT *
FROM cleaned_salary
WHERE emp_id = 25;


-- CREATE INDEX

CREATE INDEX idx_salary_emp_id
ON cleaned_salary(emp_id);


-- AFTER INDEX

EXPLAIN ANALYZE
SELECT *
FROM cleaned_salary
WHERE emp_id = 25;

