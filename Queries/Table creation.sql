use 50_Days_SQL_Challenge;

create table department
(
    dept_id VARCHAR (40),
    dept_name VARCHAR (40)
);


create table employees
(
    emp_id VARCHAR (40),
    emp_name VARCHAR (40),
    age VARCHAR (40),
    city VARCHAR (40),
    dept_id VARCHAR (40),
    hire_date VARCHAR (40)
);


create table salary
(
    salary_id VARCHAR (20),
    emp_id VARCHAR (20),
    salary VARCHAR (20),
    salary_date VARCHAR (20)
);



create table attendance 
(
    attendance_id VARCHAR (20),
    emp_id VARCHAR (10),
    attendance_date VARCHAR (10),
    status VARCHAR (10)
);



create table performance
(
    emp_id VARCHAR (10),
    rating_2022 VARCHAR (10),
    rating_2023 VARCHAR (10),
    rating_2024 VARCHAR (10)
);

