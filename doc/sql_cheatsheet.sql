--list databases
SHOW DATABASES;

--select a database to work with
USE test;

--list tables in a database
SHOW TABLES;

--list tables in a database with name containing 'someText'
SHOW TABLES LIKE '%someText%';

--create a new database
CREATE DATABASE test;

--create a new table with 2 columns 'id' and 'name'
CREATE TABLE test (id int [NULL| NOT NULL], name varchar(20) [NULL| NOT NULL]);

--create a new view
CREATE VIEW mini AS SELECT id FROM test;

--create a new index (an unique index doesn't allow duplicates)
CREATE [UNIQUE] INDEX index_id ON test(id);

--add a new column to a table
ALTER TABLE test ADD surname varchar(20) NOT NULL;

--insert a record into a table
INSERT INTO test VALUES(val1, val2, val3);

--insert an value into a row
INSERT INTO test(coulumnName) VALUES(value);

--insert into a table values from another table
INSERT INTO test(id, name, surname)
 SELECT id2, name2, surname2 FROM anotherTest WHERE id = 8;

--select values from a table and perform arithmetic calculations
SELECT title, price*2 FROM test;

--select values from a table using an alias
SELECT p.id, p.name FROM publishers p;

--select values from a table using alias name for a column
SELECT id AS 'identifier' from test;

--order the result by specyfying a column name
--DESC - a descending order, ASC - an ascending (default)
SELECT * FROM prices ORDER BY price DESC;

--order the result by specifying a column name and a column number
SELECT pub_id, price * ytd_sales FROM titles ORDER BY pub_id, 2;

--order the result by the outcome of a mathematical expression 
SELECT price * ytd_sales FROM titles ORDER BY price * ytd_sales;

--if an element is duplicated show only one occurrence
--DISTINCT must be the first element in a query and can be used only once
SELECT DISTINCT name FROM test;

--select with different WHERE conditions
SELECT * from prices
 --a value is in a closed range <20, 40>
 WHERE price BETWEEN 20 and 40;--NOT BETWEEN
 --a value is in an open range (20, 30)
 WHERE price < 20 AND price > 30;--AND, OR, NOT
 --a value is one of specified values
 WHERE state IN ('CA', 'IN', 'MD');
 --a value is NULL
 WHERE advance IS NULL;--NOT NULL
 --a value is like an expresion; %' replaces 0 to many signs, '_' replaces one sign
 WHERE phone LIKE '%456'; --NOT LIKE
 --a value with a special character for example '%'
 WHERE note LIKE '27@%' escape '@';-- search for '27%';

--select with a concatenation of a string and a value form a table
SELECT 'The publisher's name is ', name from test;

--update all values in a table
UPDATE test SET city = 'Atlanta', state= 'GA';

--remove an index
DROP INDEX id_index ON test;

--delete values from a table with a condition
DELETE FROM test WHERE id = 8;

--delete all data from a table (can be rollbacked, Data Manipulation Language)
DELETE FROM test;

--remove all data from a table (can't be rolbacked, Data Definition Language)
TRUNCATE TABLE test;

--inner join selects values exiting in both tables
SELECT Orders.OrderID, Customers.CustomerName FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--left join selects all values from Orders and existing values from customers
SELECT Orders.OrderID, Customers.CustomerName FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--cross join (cartesian) -  results in all records from table1 * all records from table2
SELECT table1.column1, table2.column2 FROM table1, table2;

--create a sequence
CREATE SEQUENCE process_id
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE --throw an error after after reaching the MAXVALUE  
  NOCACHE --values are not prelocated
  NOORDER;--values don't have to be generated in order of requests

--get the next value of a sequence
SELECT process_id.NEXTVAL INTO id FROM DUAL

--set user privileges
GRANT SELECT ON test TO userName

2. Aggregate functions:
2.1 Scalar functions
If there is no element which fits then scalar functions return NULL, except of a COUNT function which returns 0
--usage
aggregate_function([DISTINCT] arg);DISTINCT cannot be used with COUNT(*)

--a number of all records including NULLs
COUNT(*)
--a number of all records excluding NULLs
COUNT(arg)
--a sum of values (only for numbers)
SUM([DISTINCT] arg)
--an average of values (only for numbers)
AVG([DISTINCT] arg)
--min value (all types)
MIN(arg)
--max value (all types)
MAX(arg)
--a number of uniqe (all types)
COUNT([DISTINCT] arg)

2.2 Vector functions
-- Performing any arithmetic operation on NULL returns NULL
-- If GROUP BY finds NULL then a new group with NULL value is created
-- COUNT(*) counts NULLs and COUNT() doesn't
-- WHERE condition cannot contain aggregate functions but can include HAVING

--first GROUP BY pub_id and after that COUNT records
SELECT pub_id, COUNT(type) FROM titles GROUP BY pub_id;

--the following two SELECTs produce the same result
SELECT DISTINCT name FROM authors;
SELECT name FROM authors GROUP BY name;

--first choose values based on a WHERE condition, next GROUP BY a type and compute an averege (without NULL values)
SELECT type, AVG(price) FROM titles
 WHERE advance > 5000 GROUP BY type;

--first choose values based on a WHERE condition, next group by a type, compute an averege (without NULL values) and order by AVG(price)
SELECT type, AVG(price) FROM titles
 WHERE advance > 5000 GROUP BY type ORDER BY 2;

--select values based on a HAVING, next GROUP BY pub_id, count an advance
SELECT pub_id, type, COUNT(advance) FROM titles
 GROUP BY pub_id HAVING advance > 1000;
