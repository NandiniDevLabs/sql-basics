
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT COUNT(payment_id) FROM payment;

SELECT * FROM payment WHERE amount > 10;
SELECT staff_id FROM payment;
SELECT DISTINCT staff_id FROM payment;

SELECT * FROM payment;
SELECT * FROM payment WHERE customer_id = 341;
-- To get the number of payments made by customer_id 341
SELECT COUNT(payment_id) FROM payment WHERE customer_id = 341;
-- To get the total amount paid by customer_id 341
SELECT SUM(amount) FROM payment WHERE customer_id = 341;
SELECT SUM(amount) FROM payment WHERE customer_id = 318;

SELECT amount FROM payment;
SELECT SUM(amount) FROM payment;
SELECT MAX(amount) FROM payment;
SELECT MIN(amount) FROM payment;
SELECT AVG(amount) FROM payment;


SELECT * FROM payment;
-- Number of times each customer made payments
SELECT customer_id, COUNT(*)
FROM payment GROUP BY customer_id;
-- or 
SELECT customer_id, COUNT(amount)
FROM payment GROUP BY customer_id;

-- Total payment made by each customer
SELECT customer_id, SUM(amount)
FROM payment GROUP BY customer_id;
-- To verify
SELECT * FROM payment WHERE customer_id = 184;
SELECT * FROM payment WHERE customer_id = 87;


-- Maximum payment made by each customer
SELECT customer_id, MAX(amount)
FROM payment GROUP BY customer_id;
-- To verify
SELECT * FROM payment WHERE customer_id = 184;
SELECT MAX(amount) FROM payment WHERE customer_id = 184;
SELECT * FROM payment WHERE customer_id = 87;
SELECT MAX(amount) FROM payment WHERE customer_id = 87;



-- Number of times each customer made payments
SELECT customer_id, COUNT(*) as payments
FROM payment GROUP BY customer_id
ORDER BY customer_id;

-- ORDER BY - Multiple columns
SELECT * FROM payment ;
SELECT * FROM payment ORDER BY amount DESC;
SELECT * FROM payment ORDER BY amount DESC, customer_id ASC;
SELECT * FROM payment ORDER BY amount DESC, customer_id DESC;



-- Number of times each customer made payments
SELECT customer_id, COUNT(*) as payments
FROM payment GROUP BY customer_id
ORDER BY customer_id;

-- Total payment made by each customer
SELECT customer_id, SUM(amount) AS total_paid 
FROM payment GROUP BY customer_id 
ORDER BY customer_id ASC ;


SELECT customer_id, COUNT(amount) AS no_of_payments, SUM(amount) AS total_paid
FROM payment GROUP BY customer_id
ORDER BY customer_id ;


SELECT customer_id, COUNT(amount) AS no_of_payments, SUM(amount) AS total_paid
FROM payment GROUP BY customer_id
ORDER BY total_paid DESC; 

-- Getting number of payments, total amount paid, max amount paid, min amount paid, 
-- and average amount paid by each customer
SELECT customer_id, COUNT(amount) AS no_of_payments, SUM(amount) AS total_paid,
MAX(amount) , MIN(amount), AVG(amount)
FROM payment GROUP BY customer_id
ORDER BY customer_id; 


------------

-- Total payment made by each customer
SELECT customer_id, SUM(amount) AS total_paid 
FROM payment GROUP BY customer_id 
ORDER BY total_paid DESC ;


SELECT customer_id, SUM(amount) AS total_paid 
FROM payment GROUP BY customer_id 
HAVING sum(amount) > 190;

SELECT customer_id, SUM(amount) AS total_paid 
FROM payment GROUP BY customer_id 
HAVING sum(amount) > 190
ORDER BY total_paid DESC;



--- Get the list of customer who paid more than $185

SELECT * FROM payment ;
SELECT customer_id, amount FROM payment ;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING sum(amount) > 185;


SELECT customer_id, SUM(amount) AS total_paid FROM payment
GROUP BY customer_id
HAVING sum(amount) > 185
ORDER BY total_paid DESC;




--- Get top 15 customers who paid more than $150
SELECT customer_id, SUM(amount) AS total_paid FROM payment
GROUP BY customer_id
HAVING sum(amount) > 150
ORDER BY total_paid DESC;

SELECT customer_id, SUM(amount) AS total_paid FROM payment
GROUP BY customer_id
HAVING sum(amount) > 150
ORDER BY total_paid DESC
LIMIT 15;



--- Get top 20 customers who paid more than $50, which are collected by staff 2
SELECT * FROM payment;
SELECT DISTINCT staff_id FROM payment;
SELECT * FROM payment WHERE staff_id = 2;

SELECT customer_id, amount
FROM payment WHERE staff_id = 2;

SELECT customer_id, SUM(amount)
FROM payment WHERE staff_id = 2
GROUP BY customer_id;

SELECT customer_id, SUM(amount)
FROM payment WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 50; 

--- Top 20 customers who paid more than $50, which are collected by staff 2
SELECT customer_id, SUM(amount) as total_paid
FROM payment WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 50
ORDER BY total_paid DESC;


SELECT customer_id, SUM(amount) as total_paid
FROM payment WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 50
ORDER BY total_paid DESC
LIMIT 20;



---- JOINS
SELECT * FROM payment;
SELECT * FROM customer;

SElECT * FROM
payment 
JOIN customer
ON payment.customer_id = customer.customer_id ;

SElECT * FROM
payment 
JOIN customer
ON payment.customer_id = customer.customer_id 
ORDER BY payment_id ;



SElECT payment.customer_id, payment.amount, customer.first_name, customer.last_name,
customer.email FROM
payment 
JOIN customer
ON payment.customer_id = customer.customer_id ;

--- column Aliasing
SElECT payment.customer_id, payment.amount, customer.first_name AS First_NM, customer.last_name,
customer.email FROM
payment 
JOIN customer
ON payment.customer_id = customer.customer_id ;

SElECT payment.customer_id, payment.amount, customer.first_name Fn, customer.last_name,
customer.email FROM
payment 
JOIN customer
ON payment.customer_id = customer.customer_id ;



-- table aliasing
SElECT * FROM
payment p
JOIN customer c
ON p.customer_id = c.customer_id ;


SElECT p.customer_id, p.amount, c.first_name, c.last_name, c.email FROM
payment p
JOIN customer c
ON p.customer_id = c.customer_id ;


SElECT p.customer_id, p.amount, c.first_name, c.last_name, c.email FROM
payment p
JOIN customer c
ON p.customer_id = c.customer_id 
WHERE p.customer_id IN (318, 421);




-- Try to run it
SELECT p.customer_id, SUM(amount) as total_paid, 
c.first_name, c.last_name, c.email
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id 
WHERE staff_id = 2
GROUP BY p.customer_id, c.first_name, c.last_name, c.email
HAVING SUM(amount) > 50
ORDER BY total_paid DESC
LIMIT 20;


SELECT customer_id, amount, COUNT(*) FROM payment
GROUP BY customer_id, amount ORDER BY customer_id, amount;

SELECT * FROM payment WHERE customer_id = 1 ORDER BY amount;

