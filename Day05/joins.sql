--JOINS: It joins the records from at least 2 tables
--1)INNER JOIN   2)LEFT JOIN    3)RIGHT JOIN     4)FULL JOIN      5)SELF JOIN
CREATE TABLE companies 
(  
  company_id number(9), 
  company_name varchar2(20)
);
INSERT INTO companies VALUES(100, 'IBM');
INSERT INTO companies VALUES(101, 'GOOGLE');
INSERT INTO companies VALUES(102, 'MICROSOFT');
INSERT INTO companies VALUES(103, 'APPLE');
CREATE TABLE orders 
(  
  order_id number(9),
  company_id number(9), 
  order_date date
);
INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');
--1)INNER JOIN(JOIN):It will get the common data from 2 tables
SELECT companies.company_name, orders.order_id, orders.order_date, orders.company_id
FROM  orders INNER JOIN companies
ON companies.company_id = orders.company_id;
--2)LEFT JOIN:It will return all data from the 1st table
SELECT companies.company_name, orders.order_id, orders.order_date
FROM companies LEFT JOIN orders
ON companies.company_id = orders.company_id;
--3)RIGHT JOIN:It will return all data from 2nd table
SELECT companies.company_name,orders.order_id,orders.order_date
FROM companies RIGHT JOIN orders
ON companies.company_id = orders.company_id;
--4)FULL JOIN:It will return all data from two tables
SELECT companies.company_name, orders.order_id, orders.order_date
FROM companies FULL JOIN orders
ON companies.company_id = orders.company_id;
--5)SELF JOIN:
CREATE TABLE employees 
(  
  id number(2), 
  name varchar2(20),
  title varchar2(60),
  manager_id number(2) 
);
INSERT INTO employees VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO employees VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO employees VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO employees VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT e1.name AS employee_name, e2.name AS manager_name
FROM employees e1 INNER JOIN employees e2
ON e1.manager_id = e2.id;