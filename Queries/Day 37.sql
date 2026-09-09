use 50_Days_SQL_Challenge;


---1. Create procedure with IF condition to return message based on salary

CREATE procedure salary_check(IN p_emp_id Int)
begin
    declare sal int;
    SELECT salary into sal
    FROM cleaned_salary 
    WHERE emp_id = p_emp_id
    LIMIT 1;
    if sal > 50000 then 
        select 'High salary' as result;
        ELSE
        select 'Low salary' as result;
        end if;
end;

call salary_check(210);

---2. Create procedure with CASE statement to categorize employees (High / Medium / Low)


CREATE PROCEDURE salary_category(IN p_emp_id INT)
BEGIN
    DECLARE sal INT;

    SELECT salary
    INTO sal
    FROM cleaned_salary
    WHERE emp_id = p_emp_id
    LIMIT 1;

    SELECT
        p_emp_id AS emp_id,
        sal AS salary,
        CASE
            WHEN sal > 80000 THEN 'High'
            WHEN sal >= 50000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_category;
END;

call salary_category (210);

---3. Create procedure with aggregation to calculate total salary per employee

CREATE PROCEDURE total_employee_salary(IN p_emp_id INT)
BEGIN
    SELECT
        emp_id,
        SUM(salary) AS total_salary
    FROM cleaned_salary
    WHERE emp_id = p_emp_id
    GROUP BY emp_id;
END;


CALL total_employee_salary(210);

