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
SELECT *
FROM employees;
--Add 2 columns use just one code
--1)COUNTRY column it should have default value as "USA"
--2)GENDER column do not put any default value
--3)Remove the GENDER column
ALTER TABLE employees
ADD (country varchar2(20) DEFAULT 'USA',
     gender varchar2(10)
     );
ALTER TABLE employees
DROP COLUMN gender;
--4)RENAME column name
ALTER TABLE employees
RENAME COLUMN country TO country_name;
--5)RENAME table name
ALTER TABLE employees
RENAME TO workers;
SELECT *
FROM workers;
--6)MODIFY column settings
ALTER TABLE workers
MODIFY state char(20) NOT NULL;