--INTERVIEW QUESTIONS
CREATE TABLE students 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);
​
INSERT INTO students VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO students VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO students VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO students VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO students VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
INSERT INTO students VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO students VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');
​
CREATE TABLE employees 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);
​
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
​
--1) Get common names from 2 tables
--1. Way
SELECT name
FROM students
INTERSECT
SELECT name
FROM employees;
​
--2.Way
SELECT DISTINCT students.name
FROM students INNER JOIN employees
ON students.name = employees.name;
​
--2)Get unique states from employees table
SELECT DISTINCT state
FROM employees;
​
--3)Get all data if the id is even from students table
SELECT *
FROM students
WHERE MOD(id,2)=0; 
​
--4)How to count all records in a table?
SELECT COUNT(*) AS num_of_records
FROM students;
​
--5)How many different companies are there in employees table?
SELECT COUNT(DISTINCT company) AS companies
FROM employees;
​
--6)Get all records of the employee whose salary is the highest
​
--1.Step: Find the highest salary
SELECT MAX(salary)
FROM employees;
​
--2.Step: Use the first query as subquery
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary)
                FROM employees);
                
--SECOND WAY:
SELECT *
FROM employees
ORDER BY salary DESC
FETCH NEXT 1 ROW ONLY;
                
--7)Get all records of the employee whose salary is the lowest
​
--1.Step: Get the minimum salary
SELECT MIN(salary)
FROM employees;
​
--2.Step: Use the first query as subquery
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary)
                FROM employees
                );
​
--SECOND WAY:
SELECT *
FROM employees
ORDER BY salary ASC
FETCH NEXT 1 ROW ONLY;
​
--8) Get the second highest salary from employees table
SELECT MAX(salary)
FROM employees
WHERE salary < (SELECT MAX(salary)
                FROM employees);
                
--9)Get all data about the employee whose salary is the second highest (!!!!!INTERVIEW QUESTION!!!!)              
SELECT *
FROM employees
WHERE salary < (SELECT MAX(salary)
                FROM employees)
ORDER BY salary DESC
FETCH NEXT 1 ROW ONLY;
​
--10)How to convert characters to UPPER, LOWER, INITIAL cases
SELECT UPPER(state), LOWER(company), INITCAP(name)
FROM employees;