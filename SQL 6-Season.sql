CREATE TABLE words
(
word_id SMALLINT UNIQUE,
word varchar(50) NOT NULL,
number_of_letters SMALLINT
);
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
SELECT * FROM words;

--Select the words whose first character is 's' or 'a' or 'y'
SELECT word
FROM words
WHERE REGEXP_LIKE (word,'^[say]');--(.*) optional

--Select words whose last character is 'm' or 'a' or 'f'
SELECT word
FROM words
WHERE REGEXP_LIKE (word,'[maf]$')

--Select words whose first character is 's' and last character is 'a'

SELECT word
FROM words
WHERE REGEXP_LIKE (word,'^[s].*[a]$')

--Select words which have 'a' in any position
SELECT word
FROM words
WHERE REGEXP_LIKE (word,'a'); ---'a' is same with '%a%'

--Select words which have characters from 'd' to 't' at the begining followed by any character ,  then 'l'

SELECT word
FROM words
WHERE REGEXP_LIKE (word,'^[d-t].[l]');

--Select words which have characters from 'd' to 't' at the begining followed by any 2 characters and then e 


SELECT word
FROM words
WHERE REGEXP_LIKE (word,'^[d-t]..[e]');

--Select words which do not have 'h' in any position.
--NOT LIKE Condition

SELECT word
FROM words
WHERE word NOT LIKE '%h%';

--Select words which do not end with 't' and do not end with 'f'
SELECT word
FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE '%f'

--2nd WAY
SELECT word
FROM words
WHERE NOT REGEXP_LIke (word,'[f|t]$')

--Select words which start with any character, not fallowed by 'a' and 'i'

SELECT word
FROM words
WHERE NOT REGEXP_LIke (word,'.[a].*') and NOT REGEXP_LIke (word,'.[i].*')

SELECT word 
FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%'

--ORDER BY Function:To put the records in ascending order or descending order we use ORDEY BY
                   --ORDER BY Statement can be used with SELECT clause

--Put the records in descending order
SELECT*
FROM words
ORDER BY word DESC;

--NOte: In ORDER BY, Instead of field names, we can use field numbers(column number) as well.
SELECT*
FROM words
ORDER BY 3 ASC;



CREATE TABLE employees
(
employee_id SMALLINT,
employee_first_name VARCHAR(20),
employee_last_name VARCHAR(20)
);    
INSERT INTO employees VALUES(14, 'Chris', 'Tae');
INSERT INTO employees VALUES(11, 'John', 'Walker');
INSERT INTO employees VALUES(12, 'Amy', 'Star');
INSERT INTO employees VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees VALUES(15, 'Chris', 'Way');
SELECT * FROM employees;

CREATE TABLE addresses
(
employee_id numeric,
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
);

INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');

SELECT * FROM employees;
SELECT * FROM addresses














