CREATE TABLE students 
(
students_id char(9) UNIQUE,
students_name varchar2(50) NOT NULL,
students_grade number(3),
last_modification_date date
);

--To insert data for all fields
INSERT INTO students VALUES('123456789', 'Ali Can', 83, '12-Aug-20');
INSERT INTO students VALUES('234567890', 'John Walker', 83, '12-Aug-20');

--To insert data for some specific fields
INSERT INTO students(students_id, students_name) VALUES('345678901', 'Angie Star');

--Insert data just for students_id
INSERT INTO students(students_id, students_name) VALUES('456789012', 'Tedd Box');

SELECT *
FROM students;

CREATE TABLE products
(
p_id char(5),
p_name varchar2(50),
p_price number(7,2),
p_exp_date date,
CONSTRAINT p_id_pk PRIMARY KEY(p_id)
);