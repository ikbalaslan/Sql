CREATE TABLE companies
(
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;

CREATE TABLE employees
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT*FROM employees;

--Find the employee and company names whose company has more than 15000 employees
SELECT name,company
FROM employees
WHERE company IN ( SELECT company FROM companies WHERE number_of_employees>15000);

--Find the employee name and state which has companies whose companies are greater than 100
SELECT name,state FROM employees
WHERE company IN (SELECT company FROM companies WHERE company_id>'100');

--Find the company name, number of employees and avarage salary for every company.
SELECT company, number_of_employees,(SELECT avg(salary) as avg_salary FROM employees WHERE companies.company=employees.company)
FROM companies;

--Find the name of the companies, company ids, maximum and minimum salaries per company.
SELECT company , company_id,(SELECT max(salary) as max_salary FROM employees WHERE companies.company=employees.company),(SELECT min(salary) as min_salary FROM employees WHERE companies.company=employees.company)
FROM companies;

--WildCard %: IT represents zero or more characters
--Like condition: It is used with WildCards

SELECT*FROM employees
--Select employee names which start with 'E'
SELECT name FROM employees
WHERE name like 'E%';

--Select employee names which  ends with 'e'
SELECT name FROm employees
WHERE name like '%e';
--Select employee names which starts with 'B' and ends with 't'
SELECT name from employees
WHERE name like 'B%t'
--Select employee names which starts with 'B' and ends with 't'
SELECT name from employees 
WHERE name like 'B%t'
--Select the employee names which has 'e' and 'r' in any position
SELECT name FROM employees
WHERE name like '%e%r%' or name like '%r%e%'
--2) _ WildCard: It represents a single character
--Select state whose second character is 'e' and forth character is 'n'.
SELECT state FROM employees
WHERE state like '_e_n%'
--Select state whose last second character is 'i'
SELECT state FROm employees
WHERE state like '%i_';
--Select states whose second character is 'e' and it has at least 6 characters
SELECT state FROm employees
WHERE state like '_e____%';
--Select states which has 'i' in any position after second character
SELECT state
FROM employees
WHERE state LIKE '__%i%';


--3)REGEXP_LIKE Condition: You can use Regular Expressions with REGEXP_LIKE Condition
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
--Select words whose first character is 'h', the last character is 't' and second character is 'o', or 'a' or 'i'

SELECT word
FROM words
WHERE REGEXP_LIKE (word,'h[o,a,i]t')

--Select words whose first character is 'h', last character is 't' and second character can be any character from 'a' to 'e'.
SELECT word
FROM words
WHERE REGEXP_LIKE (word,'h[a-e]t')


CREATE TABLE words1
(
id int UNIQUE,
word VARCHAR(50) NOT NULL,
num_of_character int
);






INSERT INTO words1 VALUES (1004, 'hbt', 3);
    INSERT INTO words1 VALUES (1005, 'hct', 3);
    INSERT INTO words1 VALUES (1006, 'adem', 4);
    INSERT INTO words1 VALUES (1007, 'selim', 5);
    INSERT INTO words1 VALUES (1008, 'yusuf', 5);

-- Question: ilk harfi y veya a , 4. harfi m veya u olan, 4 harfli olan kelimelerin küçük harfe dikkat ederek listeleyiniz.













