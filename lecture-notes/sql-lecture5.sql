
--- JOINS----


--- INNER JOIN---
SELECT * FROM payment;
SELECT * FROM customer;

SELECT * FROM customer c 
JOIN payment p
ON c.customer_id = p.customer_id;

SELECT * FROM customer;
SELECT * FROM address;

SELECT * FROM customer c
JOIN address a
ON c.address_id = a.address_id;


SELECT c.first_name, c.last_name, c.email, a.phone
FROM customer c
JOIN address a
ON c.address_id = a.address_id;

-- Default join in INNER JOIN
SELECT c.first_name, c.last_name, c.email, a.phone
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id;

--- https://www.interviewbit.com/sql-cheat-sheet/
--- https://quickref.me/postgres.html
--- https://neon.tech/postgresqltutorial/PostgreSQL-Cheat-Sheet.pdf



------------------
SELECT * FROM payment2;
SELECT * FROM customer;

--  14553 rows
SELECT * FROM customer c 
JOIN payment2 p
ON c.customer_id = p.customer_id;

SELECT * FROM customer c 
INNER JOIN payment2 p
ON c.customer_id = p.customer_id;


--- OUTER JOIN --
--  14583 rows
SELECT * FROM customer c 
FULL OUTER JOIN payment2 p
ON c.customer_id = p.customer_id;


SELECT * FROM customer c 
FULL OUTER JOIN payment2 p
ON c.customer_id = p.customer_id
ORDER BY c.customer_id DESC;


-- LEFT JOIN
-- 14555 rows
SELECT * FROM customer c 
LEFT JOIN payment2 p
ON c.customer_id = p.customer_id;


-- RIGHT JOIN
-- 14581 rows
SELECT * FROM customer c 
RIGHT JOIN payment2 p
ON c.customer_id = p.customer_id;



---- IS NULL | IS NOT NULL

SELECT * FROM payment2 WHERE customer_id IS NULL;
UPDATE payment2 SET customer_id = NULL WHERE customer_id = 107;

SELECT * FROM payment2 WHERE customer_id = NULL; --- will not work
SELECT * FROM payment2 WHERE customer_id IS NULL; -- this is how you should use condition to filter NULL values

SELECT * FROM payment2 WHERE customer_id IS NOT NULL;



--- Sub-Queries


SELECT * FROM payment;
SELECT *, DATE(payment_date) FROM payment;
SELECT * FROM payment WHERE DATE(payment_date) >= '2007-02-20' AND  DATE(payment_date) <= '2007-02-25';
-- OR
SELECT * FROM payment WHERE DATE(payment_date) BETWEEN '2007-02-20' AND '2007-02-25';
SELECT * FROM payment WHERE DATE(payment_date) BETWEEN '2007-02-22' AND '2007-02-25';

SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) BETWEEN '2007-02-20' AND '2007-02-25';

-- Get the names of customers who made payments between START_DATE AND END_DATE
SELECT * FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-20' AND '2007-02-25'
);


SELECT * FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-20' AND '2007-02-25'
);

-- Get the names of customers who made payemnts between START_DATE AND END_DATE
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-21' AND '2007-02-22'
);

SELECT * FROM customer WHERE customer_id IN (1,5,7);


SELECT * FROM rental;
SELECT MIN(return_date), MAX(return_date) FROM rental;
SELECT * FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31';

-- GET customer names who returned product between START_DATE and END_DATE
SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31';

SELECT * FROM customer
WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31'
);

-- GET customer names who returned product between START_DATE and END_DATE
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31'
);



--- UNION
-- Get the names of customers who made payemnts between START_DATE AND END_DATE
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-21' AND '2007-02-22'
)
UNION
-- GET customer names who returned product between START_DATE_2 and END_DATE_2
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31'
);




--- UNION ALL
-- Get the names of customers who made payemnts between START_DATE AND END_DATE
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-21' AND '2007-02-22'
)
UNION ALL -- (will not delete duplicates)
-- GET customer names who returned product between START_DATE_2 and END_DATE_2
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31'
);



--- INTERSECT
-- Get the names of customers who made payemnts between START_DATE AND END_DATE
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM payment WHERE DATE(payment_date) 
	BETWEEN '2007-02-21' AND '2007-02-22'
)
INTERSECT
-- GET customer names who returned product between START_DATE_2 and END_DATE_2
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) cust_name 
FROM customer WHERE customer_id IN (
	SELECT DISTINCT customer_id FROM rental WHERE DATE(return_date) BETWEEN '2005-05-20' AND '2005-05-31'
);



