CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
--ALTER TABLE	
--THE ALTER TABLE statement is used to add, delete or modify columns in an existing tables
--THE ALTER TABLE statement is also used to add and drop costraints in an existing tables

SELECT*FROM workers
--1)We can add a column to an existing table
ALTER TABLE workers
ADD company_industry VARCHAR(20)

--2) How to add field with default value:
ALTER TABLE workers 
ADD worker_address VARCHAR(80) DEFAULT 'Miami,FL,USA';

--3) How to add multiple fields into a table:
ALTER TABLE workers
ADD number_of_workers CHAR(5) DEFAULT 0,
ADD name_of_ceo VARCHAR(20) DEFAULT 'John';

--4)How to drop a fields from a table:
ALTER TABLE workers
DROP COLUMN number_of_workers;


--5) How to rename a field/column
ALTER TABLE workers
RENAME COLUMN company_industry TO company_profession;

--6)How to rename a table:
ALTER TABLE workers
RENAME TO employees;

--7) How to modify a field(add constraint,change data types,change size ...)
--a)How to add constraint 
--a1)Add "NOT NULL" constraints to number_of_workers field
ALTER TABLE employees
ALTER COLUMN number_of_workers SET NOT NULL;

--a2)Add "UNIQUE" constraints to company_profession field
ALTER TABLE employees
ADD CONSTRAINT company_profession_unique UNIQUE(company_profession);--UNIQUE constraints accepts multiple null

--a3)Add "UNIQUE" constraints to worker_address field
ALTER TABLE employees
ADD CONSTRAINT worker_address_unique UNIQUE(worker_address)--UNIQUE constraints cannot accept duplicated values.

--b)How to change data size of a field
--b1)


SELECT*FROM employees
	





