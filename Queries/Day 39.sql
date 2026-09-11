use 50_Days_SQL_Challenge;


---1. Create BEFORE INSERT trigger to prevent negative salary insertion

CREATE Trigger before_sal_insert
before insert
on cleaned_salary
for each row 

begin
if new.salary < 0 then set new.salary = 0;
end if;
end;

---2. Automatically convert negative salary values to 0 before inserting data

insert into cleaned_salary (salary_id, emp_id, salary, salary_date)
values(501, 901, -1000, '2024-01-01');


SELECT * from cleaned_salary
WHERE emp_id=901;


---3. Create AFTER UPDATE trigger to track salary changes

CREATE Table salary_logs (emp_id INT, salary INT, old_salary INT, new_salary INT);

CREATE TRIGGER salary_update_trigger
after update
on cleaned_salary
for each row 


begin

insert into salary_logs
(emp_id, old_salary, new_salary)

values(old.emp_id, old.salary, new.salary);
end;



update cleaned_salary 
set salary = 70000
where emp_id = 463;


select * from salary_logs;







