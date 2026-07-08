USE  employee;
SELECT DATABASE();
SHOW TABLES ;

CREATE TABLE  departments(
department_id INT  ,
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

 ALTER TABLE employees 
 DROP PRIMARY KEY;
 
 ALTER TABLE departments
 DROP PRIMARY KEY;
 
 ALTER TABLE departments 
 DROP CONSTRAINT  UNIQUE;
TRUNCATE TABLE departments;
TRUNCATE TABLE locations;
 TRUNCATE TABLE employees;
 DROP TABLE departments;
 
 ALTER TABLE departments
 RENAME COLUMN deparment_id TO department_id;
 
 
 INSERT INTO departments (department_id,department_name)
 VALUES
 (2,'HR Executive'),
 (3,'Data Analyst'),
 (4,'Senior Analyst'),
 (5,'HR Assosiate' ),
 (6,'Finance Manager');
 
  
  
  INSERT INTO locations(location)
  VALUES('DUBAI'),
   ('SHARJAH'),
   ('HYDREBAD'),
   ('ABU DHABI'),
   ('MUSCAT');
   

    SELECT *FROM departments;
    SELECT *FROM locations;
    

INSERT INTO employees (employee_id,employee_name,gender, age,hire_date,  designation ,department_id,location_id,salary)
VALUES
(102, 'John','M', 28, '2021-03-11', 'HR Executive',NULL, 4,50000),
(103, 'Alice','M', 32,'2016-08-14' , 'Data Analyst', 3,4,65000),
(104, 'Bob','M', 35, '2015-10-23', 'Senior Analyst',3, 4,70000),
(105, 'David','M', 29,'2020-12-25',  'HR Associate',1,4,55000),
(106, 'Emma','F', 28,'2017-11-01'  ,'Finance Manager',6,4,80000),
(107, 'Michael','M', 31, '2015-12-25', 'Data Engineer', 3,4,60000),
(108, 'Sophia','F', 22,'2022-03-01'  ,'Financial Analyst',8,4, 75000),
(109, 'James','M', 26, '2021-06-11' ,'HR Trainee',4,4, 45000),
(110, 'Olivia','F', 27,  '2018-02-28','Finance Director',10,4, 90000),
(111, 'William','M', 30, '2023-03-18' ,'BI Developer', 11,4,58000);
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

-- ORDER BY
SELECT department_id,salary
FROM employees
ORDER BY department_id ,salary DESC;

SELECT *FROM employees ORDER BY  employee_name;

-- LIMIT
SELECT * FROM employees 
ORDER BY hire_date ASC LIMIT 5;

-- AGGREGRATE FUNCTIONS
SELECT sum(salary) AS Total_salary
FROM employees
WHERE department_id=6;


SELECT employee_name,
       age AS min_age
FROM employees
WHERE age = (
    SELECT MIN(age) 
    FROM employees
);

SELECT location_id, MAX(salary) AS maximum_salary
FROM employees
GROUP BY location_id;

SELECT designation, AVG(salary) as average_salary
FROM employees
WHERE designation LIKE '%Analyst%' 
GROUP BY designation;

-- HAVING
SELECT department_id,count(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*)<3;

SELECT  location_id,gender, count(age) AS average_age
FROM employees
WHERE gender='F'
GROUP BY location_id,gender
HAVING  AVG(age)<30;

SELECT * FROM employees where gender='F' 

-- JOINS
SELECT e.employee_name, e.designation, d.department_name
FROM employees as e
INNER JOIN departments as d
ON e.department_id = e.department_id;

SELECT d.department_name,count(e.employee_id) as total_employees
FROM departments d
LEFT JOIN employees e
ON e.department_id = e.department_id
GROUP BY d.department_name;

SELECT l.location,e.employee_name
FROM employees e
RIGHT JOIN locations l 
ON l.location_id =l.location_id;

SELECT l.location,d.department_name
FROM departments d
CROSS JOIN locations l;

-- SELF JOIN
SELECT e1.employee_name AS employee1,
       e2.employee_name AS employee2,
       e1.department_id
FROM employees e1
JOIN employees e2
ON e1.department_id = e2.department_id
AND e1.employee_id < e2.employee_id;

SELECT employee_id,
       employee_name,
       department_id
FROM employees
ORDER BY department_id;

-- WINDOWS FUNCTIONS
SELECT employee_id,
       employee_name,
       department_id,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

SELECT employee_id,
       employee_name,
       department_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS running_total_salary
FROM employees;