CREATE TABLE words
( 
  word_id number(10) UNIQUE,
  word varchar2(50) NOT NULL,
  number_of_letters number(6)
);
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
--WILDCARDS: %         _          [ ]
--1) % ==> Represents zero or more characters
--Find the words whose first character is 'h'
SELECT word
FROM words
WHERE word LIKE 'h%';
--Find the words whose last character is 'a'
SELECT word
FROM words
WHERE word LIKE '%a';
--Find any word which has 'a' in any position
SELECT word
FROM words
WHERE word LIKE '%a%';
--2) _ ==> Represents single character
--Find all words whose second character is 'e'
SELECT word
FROM words
WHERE word LIKE '_e%';
--Find all words which have 5 characters, second character is 'u' and fourth character is 'u'
SELECT word
FROM words
WHERE word LIKE '_u_u_';
--Find all words which have AT LEAST 5 characters, second character is 'u' and fourth character is 'u'
SELECT word
FROM words
WHERE word LIKE '_u_u_%';
--3) [ ] ==> For multiple options we use [ ] 
--Find all words whose first character is 'h', last character is 't' and second character is 'a' or 'i' or 'o'
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'h[aio]t'); 
--Find all words whose first character is 'h', last character is 't' and second character is from 'a' to 'f'
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'h[abcdef]t'); 
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'h[a-f]t'); 
--Find all words which contain 'a' or 'e' or 'u'
SELECT word
FROM words
WHERE REGEXP_LIKE(word,'[aeu](*)');  --'[aeu](*)' and '[aeu]' are same
--Find all words whose initials are 'a' or 's' or 'y'
SELECT word
FROM words
WHERE REGEXP_LIKE(word, '^[asy](*)'); -- ^ means initial
--Find all words whose last characters are 'a' or 'm' or 'f'
SELECT word
FROM words
WHERE REGEXP_LIKE(word, '(*)[amf]$'); -- '(*)[amf]$' and '[amf]$' are same
--4) Negative scenarios
--Find all words whose initials are NOT 'h'
SELECT word
FROM words
WHERE word NOT LIKE 'h%';
--Find all words whose last characters are NOT 'm'
SELECT word
FROM words
WHERE word NOT LIKE '%m';
--Find all words which do not contain 'el' in any position
SELECT word
FROM words
WHERE word NOT LIKE '%el%';
--Find all words starting with any character, NOT following by 'e' or 'a' or 'd'
SELECT word
FROM words
WHERE NOT REGEXP_LIKE(word,'[_ead](*)');

--ORDER BY: ORDER BY orders data in ascending order or descending order
--Put the records in ascending order by using salary field
SELECT *
FROM employees
ORDER BY salary ASC; --ASC statnds for ASCENDING
--Put the records in descending order by using state
SELECT *
FROM employees
ORDER BY state DESC; --DESC statnds for DESCENDING
--Put the records in asending order by using company name then in descending order by using salary
SELECT *
FROM employees
ORDER BY company ASC, salary DESC; --Instead of column names you can use column numbers as well