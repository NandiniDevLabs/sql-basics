
-- TABLE DATA HANDLING: SELECT, UPDATE, DELETE, INSET QUERIES


-- HANDLING TABLE, DATABASE

SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id = 386;
-- to update single cell

-- update amount of payment_id: 17685 from 3.99 to 13.99
SELECT * FROM payment WHERE payment_id=17685;
SELECT amount FROM payment WHERE payment_id=17685;
UPDATE payment SET amount = 14.99 WHERE payment_id=17685;
SELECT * FROM payment WHERE payment_id=17685;

-- add 5 dollar to the payment amount made by customer_id: 447 
SELECT * FROM payment WHERE customer_id = 447 ORDER BY amount;
SELECT customer_id, amount FROM payment WHERE customer_id = 447 ORDER BY amount;

SELECT customer_id, amount, amount + 5 new_amount FROM payment WHERE customer_id = 447 ORDER BY amount;
UPDATE payment SET amount = amount + 5 WHERE customer_id = 447;

SELECT customer_id, amount FROM payment WHERE customer_id = 447 ORDER BY amount;


--- update first names that start with letter A to upper case
SELECT * FROM actor;
SELECT * FROM actor WHERE first_name LIKE 'A%';

SELECT first_name, UPPER(first_name) first_name_up_case FROM actor WHERE first_name LIKE 'A%';
UPDATE actor SET first_name = UPPER(first_name) WHERE first_name LIKE 'A%';

SELECT * FROM actor WHERE first_name LIKE 'A%';
SELECT * FROM actor ORDER BY first_name;



-- update first_names Ellen and Elvis to lower case 
SELECT * FROM actor WHERE first_name IN ('Ellen','Elvis');

SELECT first_name, LOWER(first_name) FROM actor WHERE first_name IN ('Ellen','Elvis');
UPDATE actor SET first_name = LOWER(first_name) WHERE first_name IN ('Ellen','Elvis');

SELECT * FROM actor WHERE first_name IN ('ellen','elvis');


--- 
SELECT * FROM new_table1;
SELECT * FROM new_table2;


CREATE TABLE new_table3(
	col1 integer,
	col2 character varying
);
SELECT * FROM new_table3;




CREATE TABLE new_table3(
	col1 integer PRIMARY_KEY,
	col2 character varying
);
SELECT * FROM new_table3;

-- Reference1: https://www.w3schools.com/postgresql/postgresql_create_table.php
-- Reference2: https://www.postgresql.org/docs/current/sql-createtable.html
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
-- to drop table from database
DROP TABLE new_table1;
DROP TABLE new_table2;
DROP TABLE persons;


--- Creating copy of existing table
CREATE TABLE payment2 AS SELECT * FROM payment ;
-- Update as below in payment2 table 
-- payment2 --> right click --> properties --> columns --> for payment_id 
-- Primary Key --> Enable
-- Defauly value --> nextval('payment_payment_id_seq'::regclass)
CREATE TABLE payment3 AS SELECT * FROM payment WHERE staff_id = 1;

SELECT * FROM payment;
SELECT * FROM payment2;
SELECT * FROM payment3;


-- DELETE QUERY
SELECT * FROM payment2;
-- Delete all payments made by customer_id: 88
SELECT * FROM payment2 WHERE customer_id = 88;
DELETE FROM payment2 WHERE customer_id = 88;
SELECT * FROM payment2 WHERE customer_id = 88;


SELECT * FROM payment2 WHERE payment_id IN (17614, 17615, 17616);
DELETE FROM payment2 WHERE payment_id IN (17614, 17615, 17616);

-- INSERT
SELECT * FROM payment2 ORDER BY payment_id DESC;
INSERT INTO payment2 
(payment_id, customer_id, staff_id, rental_id, amount, payment_date)
VALUES (32099, 120, 3, 14107, 15.99, '2024-10-25'); 

INSERT INTO payment2 
(payment_id, customer_id, amount)
VALUES (32100, 120, 15.99); 

SELECT * FROM payment2 ORDER BY payment_id DESC;

INSERT INTO payment2
(customer_id, amount)
VALUES (120, 15.99); 

INSERT INTO payment2 
VALUES (33000, 120, 3, 14107, 15.99, '2024-10-24'); 

SELECT * FROM payment2 ORDER BY payment_id DESC;







---
SELECT customer_id, amount, COUNT(*) cnt FROM payment
GROUP BY customer_id, amount ORDER BY customer_id DESC, amount DESC, cnt DESC;

SELECT customer_id, amount, COUNT(*) cnt FROM payment2
GROUP BY customer_id, amount ORDER BY customer_id DESC, amount DESC, cnt DESC;

DROP TABLE payment2;



--- Doubts-----

SELECT * FROM payment2 WHERE customer_id IS NULL;
UPDATE payment2 SET customer_id = NULL WHERE customer_id = 107;

SELECT COUNT(*),customer_id,staff_id FROM payment2 
GROUP BY customer_id, staff_id
ORDER BY customer_id DESC;
