CREATE TABLE employees 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);
--SUBQUERIES: Query inside a query 
--1. Type: Use Subquery after WHERE
--Find the employee and company names whose company has more than 15000 employees
SELECT name, company
FROM employees
WHERE company IN (SELECT company
                  FROM companies
                  WHERE number_of_employees>15000
                  );
                  
--Find the company ids and number of employees if the company is in Texas
SELECT company_id, number_of_employees
FROM companies
WHERE company IN (SELECT company
                  FROM employees
                  WHERE state = 'Texas');
                  
--Find the states whose company has less than 13000 employees 
--Note: If you use DISTINCT before the column name, SQL will display repeated data just once
SELECT DISTINCT state
FROM employees
WHERE company IN (SELECT company
                  FROM companies
                  WHERE number_of_employees<13000
                  ); 
 
 
                  
--2. Type: Use Subquery just after the SELECT                  
                  
--Find the name of the companies, number of employees  and average salary for every company    
SELECT company, number_of_employees, (SELECT AVG(salary)
                                      FROM employees
                                      WHERE companies.company = employees.company
                                      ) average_salary
FROM companies;  
--Find the name of the companies, company ids, and the number of states for every company
SELECT company, company_id, (SELECT COUNT(state)
                             FROM employees
                             WHERE companies.company = employees.company
                             ) number_of_states
FROM companies; 
--Find the name of the companies, company ids, maximum and minimum salaries per company. ( MAX(salary)  MIN(salary) )
SELECT company, company_ID, (SELECT MAX(salary)
                             FROM employees
                             WHERE companies.company = employees.company
                            ) max_salary,
                            
                            (SELECT MIN(salary)
                             FROM employees
                             WHERE companies.company = employees.company
                             ) min_salary
FROM companies;
--Find the employee names, salary whose salary is less than 2000 or more than 6000
SELECT name, salary
FROM employees
WHERE salary<2000 OR salary>6000;
SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 2000 AND 6000;