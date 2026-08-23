use 50_Days_SQL_Challenge;


---1. Retrieve latest salary record for each employee

SELECT * 
from
(SELECT * , 

ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY salary_date desc)

as rn
FROM cleaned_salary) t WHERE rn = 1;


---2. Retrieve first(oldest) salary record for each employee

SELECT * 
from
(SELECT * , 

ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY salary_date asc)

as rn
FROM cleaned_salary) t WHERE rn = 1;

---3. Rank salary entries for each employee

SELECT emp_id, salary, 

ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY salary_date desc)

as rank_number
FROM cleaned_salary;

---4. Get top 2 salary records per employee

SELECT * 
from
(SELECT * , 

ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY salary_date desc)

as rn
FROM cleaned_salary) t WHERE rn <= 2;




