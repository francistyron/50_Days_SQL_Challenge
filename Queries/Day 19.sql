use 50_Days_SQL_Challenge;

---1. Categorize employees based on salary (Low / Medium / High)

select emp_id, salary, 
case 
    when salary < 30000 then 'Low'
    when salary BETWEEN 30000 and 60000 then 'Medium'
    else 'High'
end As category 
FROM cleaned_salary;

---2. Categorize employees based on performance rating (Good / Average / Poor


SELECT 
    emp_id,
    average_rating,
    CASE 
        WHEN average_rating >= 4 THEN 'Good'
        WHEN average_rating >= 3 THEN 'Average'
        ELSE 'Poor'
    END AS category
FROM (
    SELECT 
        emp_id,
        (rating_2022 + rating_2023 + rating_2024) / 3.0 AS average_rating
    FROM cleaned_performance
) AS performance_avg;


---3. Categorize employees based on attendance status (Active / Inactive)

SELECT 
    emp_id,
    status,
    CASE 
        WHEN status = 'Present' THEN 'Active'
        ELSE 'Inactive'
    END AS category
FROM cleaned_attendance;


---4. Categorize employees based on experience level (Fresher / Mid-Level / Experienced)

SELECT 
    emp_id,
    YEAR(CURDATE()) - YEAR(hire_date) AS experience_year,
    CASE 
        WHEN YEAR(CURDATE()) - YEAR(hire_date) < 2 THEN 'Fresher'
        WHEN YEAR(CURDATE()) - YEAR(hire_date) BETWEEN 2 AND 5 THEN 'Mid-Level'
        ELSE 'Experienced'
    END AS Exp_Category
FROM cleaned_employees;
