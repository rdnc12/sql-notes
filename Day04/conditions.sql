CREATE TABLE employees 
(  
  employee_id number(9), 
  employee_first_name varchar2(20),
  employee_last_name varchar2(20)
);
INSERT INTO employees VALUES(14, 'Chris', 'Tae');
INSERT INTO employees VALUES(11, 'John', 'Walker');
INSERT INTO employees VALUES(12, 'Amy', 'Star');
INSERT INTO employees VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees VALUES(15, 'Chris', 'Way');
CREATE TABLE addresses 
(  
  employee_id number(9), 
  street varchar2(20),
  city varchar2(20),
  state char(2),
  zipcode char(5)
);
INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');
--Get the first name and last name from employees table, and get the city from addresses table
--Change the column names to first_name, last_name, and city_name
--1. Way by using subquery
SELECT employee_first_name AS first_name, employee_last_name AS last_name, (SELECT city
                                                                            FROM addresses
                                                                            WHERE employees.employee_id=addresses.employee_id
                                                                            ) city_name
FROM employees;   
--2. Way
SELECT employees.employee_first_name AS first_name, employees.employee_last_name AS last_name, addresses.city AS city_name
FROM employees, addresses
WHERE employees.employee_id=addresses.employee_id;
--To make your code short you can rename(temporary) your tables by initials 
SELECT e.employee_first_name AS first_name, e.employee_last_name AS last_name, a.city AS city_name
FROM employees e, addresses a
WHERE e.employee_id=a.employee_id
ORDER BY first_name ASC, last_name DESC;
CREATE TABLE workers
(
  id number(9),
  name varchar2(50),
  state varchar2(50),
  salary number(20),
  company varchar2(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
--GROUP BY
--Find the total salary of every workers
SELECT name, SUM(salary) AS total_income
FROM workers
GROUP BY name;
--Find the number of workers per state
SELECT state, COUNT(name) AS num_of_workers
FROM workers
GROUP BY state;
--Find the number of workers whose salaries are greater than 2000 per company
SELECT company, COUNT(name) AS num_of_workers
FROM workers
WHERE salary>2000
GROUP BY company;
--Find the maximum and minimum salary for every company
SELECT company, MAX(salary) AS max_income, MIN(salary) AS min_income
FROM workers
GROUP BY company;
--HAVING: To filter records by using aggregate functions
--Aggregate functions: SUM(), COUNT(), AVG(), MAX(), MIN()
--Note: After WHERE keyword you cannot use aggregate functions.
--Note: For aggregate function to filter records we use HAVING, but use HAVING after GROUP BY
--Find the total salary if it is greater than 2500 for every worker
SELECT name, SUM(salary) AS total_income1
FROM workers
GROUP BY name
HAVING SUM(salary)>2500;
--Interview Question: Can you use WHERE to filter for aggregate functions?
--Answer: No, for aggregate functions to filter records we need to use HAVING.
--Interview Question: What is the difference between WHERE and HAVING?
--Answer: For aggregate functions to filter records we need to use HAVING.
--Find the number of workers if it is more than 1 per state
SELECT state, COUNT(name) AS num_of_workers
FROM workers
GROUP BY state
HAVING COUNT(name)>1;
--Find the minimum salary if it is more than 2000 per company
SELECT company, MIN(salary) AS min_salary
FROM workers
GROUP BY company
HAVING MIN(salary)>2000;
--Find the maximum salary if it is between 2500 and 8000 per state
--1. Way
SELECT state, MAX(salary) AS max_salary
FROM workers
GROUP BY state
HAVING MAX(salary)>=2500 AND MAX(salary)<=8000;
--2. Way: This is recommended
SELECT state, MAX(salary) AS max_salary
FROM workers
GROUP BY state
HAVING MAX(salary) BETWEEN 2500 AND 8000;