
SELECT * FROM customer;
SELECT COUNT(*) FROM customer;

SELECT customer_id FROM customer;
SELECT COUNT(customer_id) FROM customer;

SELECT customer_id, first_name, last_name, email FROM customer ;

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE 'V%';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name = 'Vijaya';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name IN ('Vijaya', 'Nandini');

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name IN ('Victor', 'Vijaya');


--- LIKE
SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE 'Ha%';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE '%ra';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE '%ra%';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE 'Ha%';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name LIKE 'ha%';  -- Names are starting with Upper case and hence there is no output


--- ILIKE : Case insensitive like
SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name ILIKE 'Ha%';

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name ILIKE 'ha%';


-- Single quote for data type: varchar (meaning string), or date
-- Double quote for column_names or table_names
SELECT * FROM customer;
SELECT customer_id, first_name, last_name FROM customer WHERE first_name = 'Kelly';

SELECT * FROM "customer";
SELECT "customer_id", "first_name", "last_name" FROM "customer" WHERE "first_name" = 'Kelly';


/* Comparision Operators
=, != , < , > , <= , >= 


Logical Operators --> AND OR NOT
*/

SELECT * FROM payment;
SELECT * FROM payment ORDER BY amount;
SELECT * FROM payment ORDER BY amount DESC;
SELECT * FROM payment ORDER BY amount, customer_id DESC; --- Not expected output


SELECT amount FROM payment;
SELECT DISTINCT amount FROM payment;
SELECT DISTINCT amount FROM payment ORDER BY amount;



SELECT * FROM customer;
SELECT DISTINCT first_name FROM customer;
SELECT DISTINCT store_id FROM customer; -- to get list of distinct stores
SELECT COUNT(DISTINCT store_id) FROM customer; -- to get count of distinct stores


SELECT * FROM actor;
SELECT COUNT(*) FROM actor;
SELECT COUNT(actor_id) FROM actor;


SELECT * FROM actor ORDER BY last_name DESC;
SELECT last_name, first_name FROM actor ORDER BY last_name DESC;

SELECT * FROM actor WHERE last_name = 'Williams';
SELECT * FROM actor WHERE last_name IN ('Williams','Garland');

SELECT * FROM actor WHERE first_name LIKE 'A%';
SELECT * FROM actor WHERE first_name LIKE 'a%';
SELECT * FROM actor WHERE first_name ILIKE 'a%';

SELECT COUNT(first_name) FROM actor; -- count 
SELECT DISTINCT first_name FROM actor; -- distinct list
SELECT COUNT(DISTINCT first_name) FROM actor; -- distinct count


SELECT * FROM payment;
SELECT * FROM payment WHERE amount = 11.99; -- 8 payments were made which are equal to 11.99 dollars
SELECT customer_id, amount FROM payment WHERE amount = 11.99;

SELECT * FROM payment WHERE amount > 10; -- 107 payments were made which are greater than 10 dollars
SELECT DISTINCT customer_id FROM payment WHERE amount > 10;

SELECT * FROM payment WHERE amount > 5; -- 3618 payments were made which are greater than $5
SELECT DISTINCT customer_id FROM payment WHERE amount > 5; -- 597 unique customers made payments > $5
-- Count of unique customers who paid more than $5
SELECT COUNT(DISTINCT customer_id) FROM payment WHERE amount > 5; 

SELECT * FROM payment WHERE amount > 5;
SELECT * FROM payment WHERE amount > 5 ORDER BY amount DESC;

-- Top 150 payments with maximum amount spent
SELECT * FROM payment WHERE amount > 5 ORDER BY amount DESC LIMIT 150;

SELECT * FROM customer WHERE customer_id <= 20 ORDER BY customer_id ;
SELECT * FROM customer ORDER BY customer_id LIMIT 2;

SELECT * FROM customer ;
SELECT * FROM customer WHERE store_id = 1;
SELECT * FROM customer WHERE store_id != 1;
SELECT * FROM customer WHERE customer_id > 20;
SELECT * FROM customer WHERE customer_id < 20;
SELECT * FROM customer WHERE customer_id <= 20;
SELECT * FROM customer WHERE customer_id >= 20;

SELECT * FROM customer WHERE customer_id BETWEEN 51 AND 80;

SELECT * FROM customer 
WHERE customer_id <= 25 AND store_id = 2;

SELECT * FROM customer WHERE 
customer_id <= 25 OR store_id = 2;

SELECT * FROM language;
SELECT * FROM language WHERE name = 'French';
SELECT * FROM language WHERE NOT name = 'French';
SELECT * FROM language WHERE name IN ('French','English','German');

SELECT * FROM language WHERE 
name = 'French' OR name = 'English' OR name = 'German';


SELECT * FROM payment;
SELECT amount FROM payment;
-- Aggregate functions -- MAX, MIN, SUM, AVG, COUNT
SELECT MAX(amount) FROM payment;
SELECT MIN(amount) FROM payment;
SELECT AVG(amount) FROM payment;
SELECT SUM(amount) FROM payment;
SELECT COUNT(amount) FROM payment;


-- GROUP BY
SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id = 341; -- Customer with id 341, has made 22 payments
SELECT * FROM payment WHERE customer_id = 318; -- Customer with id 318, has made 7 payments

SELECT customer_id, COUNT(*) FROM payment GROUP BY customer_id;

SELECT customer_id, COUNT(*) FROM payment GROUP BY customer_id ORDER BY customer_id;

SELECT customer_id, COUNT(*) FROM payment GROUP BY customer_id ORDER BY COUNT ;


SELECT * FROM customer;
SELECT first_name, last_name FROM customer;
-- aliasing --> renaming column_name or table_name
SELECT first_name AS fn, last_name FROM customer;
SELECT first_name AS fn, last_name AS ln FROM customer;



-- SQL is case insensitive : it doesn't matter if we use lower case or upper case
select first_name as fn, last_name from customer; 


-- GROUP BY
SELECT * FROM payment;
-- To get the number of times customer has made the payments
SELECT customer_id, COUNT(*) AS visits FROM payment GROUP BY customer_id ORDER BY visits;


--- To get total amount paid by each customer
SELECT * FROM payment;
SELECT customer_id, amount FROM payment ;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY customer_id;

SELECT customer_id, SUM(amount) AS total_paid FROM payment 
GROUP BY customer_id ORDER BY total_paid ;
SELECT customer_id, SUM(amount) AS total_paid FROM payment 
GROUP BY customer_id ORDER BY total_paid DESC ;


SELECT customer_id, SUM(amount) AS total_paid FROM payment 
GROUP BY customer_id ORDER BY total_paid DESC LIMIT 5;



