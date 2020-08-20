--ALTER: To make permanent updates on a table we use ALTER TABLE command
--1)We can add new columns to a table by using ALTER TABLE
ALTER TABLE workers
ADD phone char(13);
--If you use DEFAULT, you will have default data instead of '-'
ALTER TABLE workers
ADD country varchar2(20) DEFAULT 'The USA';
SELECT *
FROM workers;
--2)We can add multiple columns in one code
ALTER TABLE workers
ADD (gender varchar2(20),
     security_check varchar2(10) DEFAULT 'done'
    );
    
--3)We can DROP column from a table
ALTER TABLE workers
DROP COLUMN phone;