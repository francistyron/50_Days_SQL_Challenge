use 50_Days_SQL_Challenge;

---1. Create temporary table for employee salary summary

CREATE TEMPORARY TABLE temp_sal_summary
(emp_id INT, 
total_salary INT);

---2. Insert aggregated salary data into temporary table

INSERT INTO temp_sal_summary (emp_id, total_salary)
SELECT emp_id, sum(salary)
from cleaned_salary
GROUP BY emp_id;

select * from temp_sal_summary;

---3. Join temporary table with employee table to fetch employee details

SELECT e.emp_id, e.emp_name, t.total_salary 
FROM cleaned_employees e 
JOIN temp_sal_summary t 
ON e.emp_id = t.emp_id;

---4. Drop temporary table after usage

DROP temporary table temp_sal_summary;




