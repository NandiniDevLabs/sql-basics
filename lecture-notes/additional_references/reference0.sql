/* This is 
multi-line 
comments
*/

-- this is single line comment

SELECT * FROM payment; --   * will selecting all columns
SELECT amount FROM payment ; -- selecting single column
SELECT amount,payment_date FROM payment; -- selecting multiple columns
SELECT COUNT(*) FROM payment; -- to get total row count
SELECT COUNT(amount) FROM payment; -- to get total row count
SELECT DISTINCT amount FROM payment; -- to get unique values
SELECT DISTINCT amount FROM payment ORDER BY amount ; -- to get unique values in an order
SELECT DISTINCT amount FROM payment ORDER BY amount ASC; -- to get unique values in an ascending order
SELECT DISTINCT amount FROM payment ORDER BY amount DESC; -- to get unique values in descending order

--Comparision operators: = , < , > , <= , >= , !=
SELECT COUNT(*) FROM payment WHERE amount <= 0.99 AND staff_id = 1 ; 


SELECT * FROM payment;
--Aim: Identifying the customer with maximum amount
SELECT customer_id,sum(amount) total FROM payment GROUP BY customer_id ORDER BY total DESC LIMIT 1;

-- 1. Need to the total amount paid by each customer
SELECT customer_id,sum(amount) total,count(*) cnt FROM payment GROUP BY customer_id ORDER BY total DESC

--a. Get total payment of one customer
SELECT SUM(amount) FROM payment WHERE customer_id = 341;

SELECT * FROM actor WHERE first_name = 'Johnny'


 