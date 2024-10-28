
CREATE DATABASE test2;


CREATE TABLE student (
	student_id bigint PRIMARY KEY,
	first_name character varying(20) NOT NULL,
	last_name character varying(20),
	joining_date date,
	release_date date
);

SELECT student_id, first_name, last_name, joining_date, release_date
	FROM public.student;

SELECT * FROM public.student;
SELECT * FROM student;

INSERT INTO student (student_id, first_name, last_name, joining_date, release_date)
VALUES (1001,'abc',null,'2023-02-25',null);

INSERT INTO public.student(
	student_id, first_name, last_name, joining_date, release_date)
	VALUES (1002, 'jkl', 'k', null, null);


SELECT * FROM student WHERE student_id = 1002;
UPDATE student SET joining_date = '2023-03-01',release_date = '2023-03-15' WHERE student_id = 1002;


SELECT * FROM student WHERE student_id = 1001;
DELETE FROM student WHERE student_id = 1001;

SELECT * FROM iris;
SELECT petal_length FROM iris;
SELECT petal_length,petal_width,variety FROM iris;

SELECT variety,* FROM iris;

SELECT * FROM iris;
SELECT petal_width FROM iris;
SELECT DISTINCT petal_width FROM iris;
SELECT DISTINCT petal_width FROM iris ORDER BY petal_width; -- default: ASC
SELECT DISTINCT petal_width FROM iris ORDER BY petal_width DESC; 

SELECT * FROM iris;
SELECT DISTINCT petal_width FROM iris;
SELECT DISTINCT petal_width FROM iris;
SELECT count(*),petal_width FROM iris GROUP BY petal_width;
SELECT count(*),petal_width FROM iris GROUP BY petal_width ORDER BY count DESC;
SELECT count(*),petal_width FROM iris GROUP BY petal_width ORDER BY petal_width DESC;

SELECT COUNT(DISTINCT amount) FROM payment;

SELECT * FROM payment WHERE customer_id = 341;
SELECT amount FROM payment WHERE customer_id = 341;
SELECT COUNT(amount) FROM payment WHERE customer_id = 341;
SELECT COUNT(amount),amount FROM payment WHERE customer_id = 341 GROUP BY amount;
SELECT COUNT(*),amount FROM payment WHERE customer_id = 341 GROUP BY amount;

SELECT amount FROM payment WHERE customer_id = 341;
SELECT SUM(amount) FROM payment WHERE customer_id = 341;
SELECT AVG(amount) FROM payment WHERE customer_id = 341;
SELECT MAX(amount) FROM payment WHERE customer_id = 341;
SELECT MIN(amount) FROM payment WHERE customer_id = 341;

--operators
--Logical operators: AND OR and NOT
-- comparision operators: = , != or <> , >, <, >=, <= 

SELECT * FROM payment WHERE customer_id = 341; -- 22 rows
SELECT * FROM payment WHERE amount = 6.99; -- 1011 rows

SELECT * FROM payment WHERE customer_id = 341 AND amount = 6.99; -- 2 rows
SELECT * FROM payment WHERE customer_id = 341 OR amount = 6.99; -- 1031: 1011 + 22 - 2

SELECT * FROM payment WHERE customer_id IN (341, 250, 3400, 34);
SELECT * FROM payment WHERE customer_id NOT IN (341, 250, 3400, 34);

SELECT * FROM payment WHERE (customer_id = 341 AND amount = 6.99) OR (customer_id = 34 AND amount=2.99); -- 9 rows
SELECT * FROM payment WHERE (customer_id = 341 AND amount != 6.99) OR (customer_id = 34 AND amount <> 2.99); -- 37 rows

SELECT * FROM film;
SELECT * FROM film WHERE title = 'Born Spinal';
SELECT * FROM film WHERE title LIKE 'A%';
SELECT * FROM film WHERE title LIKE 'Al%';
SELECT * FROM film WHERE title LIKE 'AL%';
SELECT * FROM film WHERE title ILIKE 'AL%';

SELECT * FROM film;
SELECT * FROM film WHERE rental_duration > 3 ;

SELECT COUNT(*) film_count,rental_duration
FROM film
WHERE rental_duration > 3
GROUP BY rental_duration
--HAVING rental_duration > 5
HAVING COUNT(*) > 200
--HAVING film_count > 200 -- Note: with column alias name we shouldn't use
--ORDER BY rental_duration
--ORDER BY COUNT(*) 
ORDER BY film_count
LIMIT 1;


SELECT * FROM payment; -- payment_id, customer_id,staff_id,rental_id,...
SELECT * FROM customer; -- cusomter_id, store_id, address_id, ...

SELECT --* 
--p.amount,c.first_name,c.last_name
MAX(p.amount) max_amount,c.first_name,c.last_name
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
--WHERE c.first_name = 'Peter' AND c.last_name = 'Menard'
GROUP BY c.first_name,c.last_name
--HAVING max_amount > 10 -- Note: with column alias name we shouldn't use, it will throw error
HAVING MAX(p.amount) > 9
--ORDER BY MAX(p.amount)
--ORDER BY max_amount DESC
--ORDER BY max_amount,first_name
ORDER BY max_amount,first_name DESC
LIMIT 50;


SELECT MAX(amount),customer_id FROM payment GROUP BY customer_id;
SELECT * FROM customer;

SELECT MAX(p.amount)/*,p.customer_id,c.customer_id*/,c.first_name,c.last_name
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
WHERE c.first_name = 'Hilda' AND c.last_name = 'Hopkins'
GROUP BY /*p.customer_id,c.customer_id,*/c.first_name,c.last_name;



SELECT * FROM film; -- film_id
SELECT * FROM film_category; -- film_id , category_id
SELECT * FROM category; -- category_id

SELECT f.title, f.description, f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id 
WHERE c.name = 'Classics';



SELECT * FROM category; -- Classics -> category_id = 4

SELECT * FROM film_category WHERE category_id = 4 ;

--sub query
SELECT * FROM film WHERE film_id IN (
	SELECT film_id FROM film_category WHERE category_id = 4
	);


/*-----  list of films(title,..) that actor:Nick Stallone has worked on ---*/


SELECT * FROM actor; -- actor_id
SELECT * FROM film; -- film_id

SELECT * FROM film_actor; -- actor_id , film_id
SELECT * FROM film_category; -- not useful

SELECT * FROM actor a
JOIN film_actor f ON a.actor_id = f.actor_id
JOIN film z ON z.film_id = f.film_id
WHERE first_name = 'Nick' and last_name = 'Stallone';

SELECT * FROM actor WHERE first_name = 'Penelope' and last_name = 'Guiness';
-- actor_id = 44

SELECT * FROM film_actor WHERE actor_id = 44;
SELECT film_id FROM film_actor WHERE actor_id = 44;

SELECT * FROM film WHERE film_id IN (SELECT film_id FROM film_actor WHERE actor_id = 1);

SELECT * FROM film WHERE film_id IN (
	SELECT film_id FROM film_actor WHERE actor_id IN(
			SELECT actor_id FROM actor WHERE first_name = 'Nick' and last_name = 'Stallone'
	)
);


---- practice example: film_category and category
---address, city and country



CREATE TABLE payment2 AS SELECT * FROM payment;   -- payment2 -> properties -> columns -> payment_id -> enable primary key
CREATE TABLE customer2 AS SELECT * FROM customer; -- customer2 -> properties -> columns -> customer_id -> enable primary key



SELECT * FROM payment2;
SELECT * FROM payment2 WHERE customer_id IS null;
SELECT * FROM payment2 WHERE customer_id BETWEEN 150 AND 250; -- 2465 rows
UPDATE payment2 SET customer_id = null WHERE customer_id BETWEEN 150 AND 250;
SELECT * FROM payment2 WHERE customer_id IS null;


SELECT * FROM customer2;
SELECT * FROM customer2 WHERE customer_id IS null; -- because customer_id is primary_key null values will not be there
SELECT * FROM customer2 WHERE customer_id BETWEEN 450 AND 550; -- 101 rows

SELECT customer_id FROM customer2;
SELECT customer_id * 100 FROM customer2;
SELECT customer_id, customer_id * 100 AS new_customer_id FROM customer2;

UPDATE customer2 SET customer_id = customer_id * 100 WHERE customer_id BETWEEN 450 AND 550;
SELECT * FROM customer2 WHERE customer_id BETWEEN 450 AND 550;
SELECT * FROM customer2 WHERE customer_id BETWEEN 45000 AND 55000;
SELECT * FROM customer2 WHERE customer_id BETWEEN (450 * 100) AND (550 * 100);

SELECT * FROM customer2 ORDER BY customer_id DESC;



SELECT payment_id,customer_id,amount FROM payment WHERE amount IN (2.99,9.99);
CREATE TABLE payment3 AS SELECT payment_id,customer_id,amount FROM payment WHERE amount IN (2.99,9.99);


SELECT * FROM payment2;
SELECT * FROM payment2 ORDER BY customer_id DESC;
SELECT * FROM customer2;
SELECT * FROM customer2 ORDER BY customer_id DESC;

SELECT * FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;

SELECT * FROM payment2 p2
INNER JOIN customer2 c2 ON p2.customer_id = c2.customer_id; --- Assignment: Why 9675 rows are coming in the result?

