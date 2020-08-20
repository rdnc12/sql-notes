--SET Operation: UNION, INTERSECT, MINUS
--1) UNION: It returns the results of 2 queries
--Display the result of following 2 queries in the same table
--Query 1: Find the states whose salaries are greater than 2500
--Query 2: Find the workers whose salaries are less than 1500
--Rules to use UNION
--1)Data types of corresponding columns must match
--2)Number of columns in queries must be same
SELECT state AS state_or_worker, salary
FROM workers
WHERE salary > 2500
UNION
SELECT name, salary 
FROM workers
WHERE salary<1500;
--Display the result of following 2 queries in the same table
--Query 1: Find the companies which are in Texas
--Query 2: Find the workers who are working in Texas or Virginia
--Note:UNION operation does not display repeated records
--Note:If you want to see repeated records, you need to use UNION ALL
SELECT company AS company_or_worker,state
FROM workers
WHERE state = 'Texas'
UNION
SELECT name,state
FROM workers
WHERE state IN ('Texas','Virginia');
--2)INTERSECT: To get common records from 2 queries, use INTERSECT
--Display the common records of the following queries
--1)Workers whose salaries are greater than 1000
--2)Workers whose salaries are less t han 2000
--Note: Same rules with UNION is valid for INTERSECTION
SELECT name, salary
FROM workers
WHERE salary>1000
INTERSECT
SELECT name, salary
FROM workers
WHERE salary<2000;
--3)MINUS: To get difference of first query from second query
--Find the workers whose salaries are less than 3000 and they are not in Google
--Note: Same rules with UNION is valid for MINUS
SELECT name, salary
FROM workers
WHERE salary<3000
MINUS
SELECT name, salary
FROM workers
WHERE company='GOOGLE';
--Find the workers whose salaries are greater than 1500 and they are not in Texas
SELECT name, salary
FROM workers
WHERE salary>1500
MINUS
SELECT name, salary
FROM workers
WHERE state ='Texas'; 
