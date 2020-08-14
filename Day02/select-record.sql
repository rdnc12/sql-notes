--How to use SELECT Command

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');

--1)How to select all records from a table
--If you use * and no filter it will display all records
SELECT *
FROM people;

--2)How to select some specific fields
SELECT ssn, name
FROM people;

--3)How to select some specific records
SELECT *
FROM people
WHERE name < 'Maryy';

SELECT *
FROM people
WHERE name<'N' AND name>'M';

--4)Instead of multiple OR we use IN
SELECT *
FROM people
WHERE address = 'Florida' OR address = 'Virginia' OR address = 'Michigan' OR address = 'California';

SELECT *
FROM people
WHERE address IN ('Florida', 'Virginia', 'Michigan', 'California');

--5)Get the records from Florida to New Jersey in alphabetical order
SELECT ssn, address
FROM people
WHERE address>='Florida' AND address<='New Jersey';

--If you use BETWEEN it means boundaries are inclusive
SELECT ssn, address
FROM people
WHERE address BETWEEN 'Florida' AND 'New Jersey';