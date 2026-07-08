-- TO CREATE EMPLOYEE DATABASE
CREATE DATABASE employee;
USE  employee;


CREATE TABLE  departments(
deparment_id INT UNIQUE PRIMARY KEY,
department_name VARCHAR(100)  NOT NULL
);



CREATE TABLE location(
location_id INT AUTO_INCREMENT,
location VARCHAR(30)  UNIQUE NOT NULL,
PRIMARY KEY (location_id) 
);


CREATE TABLE employees(
employee_id INT ,
employee_name VARCHAR(50)  NOT NULL,
gender  ENUM('M' ,'F') ,
age INT CHECK(age>18) ,
hire_date DATE DEFAULT(CURRENT_DATE),
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2) 
 );

-- ALTER TABLE -ADD
ALTER TABLE employees
ADD COLUMN email VARCHAR(30) NOT NULL;
 
 -- ALTER TABLE -DROP
ALTER TABLE employees
DROP  COLUMN age;

-- ALTER TABLE -MODIFY
ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(50);

-- ALTER -RENAME COLUMN
ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;

--  -RENAME TABLE
RENAME  TABLE departments  TO deparments_info;
RENAME TABLE location TO locations;

CREATE TABLE employees(
employee_id INT ,
employee_name VARCHAR(50)  NOT NULL,
gender  ENUM('M' ,'F') ,
age INT CHECK(age>18) ,
hire_date DATE DEFAULT(CURRENT_DATE),
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2) 
);
 ALTER TABLE employees 
 DROP PRIMARY KEY;


INSERT INTO employees (employee_id,employee_name,gender, age,hire_date,  designation ,salary)
VALUES
(102, 'John','M', 28, '2021-03-11', 'HR Executive', 50000),
(103, 'Alice','M', 32,'2016-08-14' , 'Data Analyst', 65000),
(104, 'Bob','M', 35, '2015-10-23', 'Senior Analyst', 70000),
(105, 'David','M', 29,'2020-12-25',  'HR Associate',55000),
(106, 'Emma','F', 38,'2017-11-01'  ,'Finance Manager',80000),
(107, 'Michael','M', 31, '2015-12-25', 'Data Engineer', 60000),
(108, 'Sophia','F', 34,'2022-03-01'  ,'Financial Analyst', 75000),
(109, 'James','M', 26, '2021-06-11' ,'HR Trainee', 45000),
(110, 'Olivia','F', 40,  '2018-02-28','Finance Director', 90000),
(111, 'William','M', 30, '2023-03-18' ,'BI Developer', 58000);

SELECT * FROM employees ;

  -- AS  -ALIAS
SELECT age AS employee_age FROM employees;
SELECT salary AS employee_salary FROM employees;

 -- WHERE 
SELECT * FROM employees WHERE salary>50000 ;
SELECT * FROM employees WHERE hire_date <'2016-01-01';


 -- UPDATE TABLE
 
 SET  SQL_SAFE_UPDATES =0;
 UPDATE employees
 SET designation =" data scientist"
 WHERE employee_id = 109;

