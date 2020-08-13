--How to create CONSTRAINTS(restrictions) for fields in a table

--students_id field should not have repeated data (All data in students_id must be UNIQUE)
--students_name field should NOT be NULL (We have to enter data for every cell in students_name field.)
CREATE TABLE students 
(
students_id char(9) UNIQUE,
students_name varchar2(50) NOT NULL,
students_grade number(3),
last_modification_date date
);

--What is the PRIMARY KEY?
--PRIMARY KEY is a constraint 1)Primary Key does not accept duplication
--                            2)Primary Key does not accept NULL as data
--                            3)In a table you can use just 1 primary key

--To make a field PRIMARY KEY we have 2 ways
--1. Way:
CREATE TABLE products
(
p_id char(5) PRIMARY KEY,
p_name varchar2(50),
p_price number(7,2),
p_exp_date date
);

--2. Way:
CREATE TABLE products
(
p_id char(5),
p_name varchar2(50),
p_price number(7,2),
p_exp_date date,
CONSTRAINT p_id_pk PRIMARY KEY(p_id)
);


CREATE TABLE products05
(
p_id char(5),
p_name varchar2(50),
p_price number(7,2),
p_exp_date date,
CONSTRAINT p_id_fk FOREIGN KEY(p_id) REFERENCES products(p_id)
);