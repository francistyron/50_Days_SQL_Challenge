use 50_Days_SQL_Challenge;


---1. Create BEFORE UPDATE trigger to prevent negative salary updates

CREATE Trigger prevent_negative_salary
before update 
ON cleaned_salary 
for each row

begin
if new.salary < 0 then
set new.salary = old.salary;
end if;
end;


SELECT * from cleaned_salary
WHERE emp_id=164;


UPDATE cleaned_salary 
set salary = 5000
WHERE emp_id = 164;



---2. Create AFTER INSERT trigger to log attendance records automatically


CREATE Table attendance_logs (emp_id INT, attendance_date date, message varchar(100));

CREATE Trigger attendance_insert_log
after insert 
on cleaned_attendance 
for each row 

begin 

INSERT into attendance_logs (emp_id, attendance_date, message)
VALUES(new.emp_id, new.attendance_date, 'Attendance added');
end;


SELECT * from attendance_logs;

INSERT into cleaned_attendance 
VALUES(202601, 101, '2026-08-06', 'present');



