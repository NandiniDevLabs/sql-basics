SELECT * FROM inventory;

-- How many film_ids are there in this table -> 
-- total count
SELECT COUNT(film_id) FROM inventory;
--or
SELECT COUNT(*) FROM inventory;

--distinct count
SELECT COUNT(DISTINCT film_id) FROM inventory;


SELECT * FROM inventory;
SELECT DISTINCT film_id FROM inventory ORDER BY film_id ASC;

SELECT * FROM inventory WHERE film_id BETWEEN 150 AND 200 ;
SELECT * FROM inventory WHERE film_id > 150 AND film_id <=200 ;


SELECT * FROM inventory;
--No of inventories for each store 
SELECT store_id,COUNT(*) FROM inventory GROUP BY store_id ORDER BY count
SELECT store_id,COUNT(*) FROM inventory GROUP BY store_id ORDER BY COUNT(*) 
SELECT store_id,COUNT(*) num_inv FROM inventory GROUP BY store_id ORDER BY num_inv

--number of inventories for each film
SELECT DISTINCT film_id FROM inventory;
SELECT film_id, COUNT(inventory_id) FROM inventory GROUP BY film_id ;


SELECT film_id,length FROM film order by length;
-- how many film are there for each length
SELECT COUNT(*),length FROM film GROUP BY length;
SELECT * FROM film WHERE length=87;


--Aliases 
--Column alias
SELECT customer_id,COUNT(*) cnt FROM payment GROUP BY customer_id; --
SELECT customer_id,COUNT(*) AS cnt FROM payment GROUP BY customer_id; 

-- table alias
SELECT * FROM payment p WHERE amount > 5;
SELECT * FROM payment p WHERE p.amount > 5; -- 
SELECT * FROM payment AS p WHERE p.amount > 5; 


SELECT * FROM actor ;
SELECT * FROM actor WHERE last_name='Wood';
SELECT * FROM actor WHERE last_name IN ('Wood', 'Phoenix');
SELECT * FROM actor WHERE actor_id IN (1,2,3,4,5);


SELECT * FROM actor WHERE first_name LIKE 'Ri%' ;
SELECT * FROM actor WHERE first_name LIKE 'R%' OR first_name LIKE 'A%' ;
SELECT * FROM actor WHERE first_name LIKE 'R%' ;
SELECT * FROM actor WHERE first_name LIKE 'A%' ;

SELECT * FROM actor ;
SELECT * FROM actor WHERE first_name LIKE 'Al%' ; -- any number of caraters
SELECT * FROM actor WHERE first_name LIKE 'Al__' ; --for only one character
SELECT * FROM actor WHERE first_name LIKE 'A_' ; --for only one character

SELECT * FROM actor WHERE first_name LIKE 'P%' ; -- case insensitive
UPDATE actor SET first_name='penelope' WHERE actor_id IN (104,120) ; 

SELECT * FROM actor WHERE first_name LIKE 'P%' ; -- case sensitive
SELECT * FROM actor WHERE first_name LIKE 'p%' ; -- case sensitive

SELECT * FROM actor WHERE first_name ILIKE 'P%' ; -- case insensitive
SELECT * FROM actor WHERE first_name ILIKE 'p%' ; -- case insensitive



-- To check conditions with single value 
-- Operators for numbers, dates: > , < , >= , <= , = , !=  
-- Operators for strings: = , != 

SELECT * FROM payment;
SELECT * FROM payment WHERE amount=7.99 ;
SELECT * FROM payment WHERE amount > 7.99 ;
SELECT * FROM payment WHERE amount >= 7.99 ;
SELECT * FROM payment WHERE amount < 7.99 ;
SELECT * FROM payment WHERE amount <= 7.99 ;
SELECT * FROM payment WHERE amount != 7.99 ;


SELECT * FROM language;
SELECT * FROM language WHERE language_id = 4 ;
SELECT * FROM language WHERE language_id > 4 ;
SELECT * FROM language WHERE language_id >= 4 ;
SELECT * FROM language WHERE language_id < 4 ;
SELECT * FROM language WHERE language_id <= 4 ;
SELECT * FROM language WHERE language_id != 4 ; 
SELECT * FROM language WHERE language_id NOT IN (4,6) ;  -- for multiple values
SELECT * FROM language WHERE language_id IN (4,6) ;  -- for multiple values


SELECT * FROM language;
SELECT * FROM language WHERE name = 'English' ; 
SELECT * FROM language WHERE name != 'English' ; 
SELECT * FROM language WHERE name NOT IN ('English','Japanese') ;  -- for multiple values

SELECT * FROM payment ;
SELECT * FROM payment WHERE customer_id IN (350,450,550) ; 
SELECT SUM(amount),customer_id FROM payment WHERE customer_id IN (350,450,550) GROUP BY customer_id;

-- payment -> properties -> columns -> coulmn amount : disable the not null button
UPDATE payment SET amount=NULL WHERE customer_id IN (350,450,550) ;

SELECT * FROM payment WHERE customer_id IN (350,450,550,351) ;

/* SQL Data Types
NUMERIC
VARCHAR 
NULL
DATE
TIMESTAMP
TIMESTAMP WITH TIMEZONE
*/


-- JOINS
-- In the database, multiple tables will be there
-- The structure of table will be based on the data we are storing in it

--Aim: Fetch data that is stored in multiple tables
-- We use joins

SELECT * FROM payment;
SELECT * FROM customer;

SELECT * FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;


SELECT * FROM payment
JOIN customer 
ON payment.customer_id=customer.customer_id;

--for few columns from both tables
SELECT p.amount FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;

SELECT amount FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;

SELECT customer_id FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;

SELECT p.customer_id FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;

SELECT p.payment_date,p.amount,c.first_name,c.last_name FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id;

SELECT p.payment_date,p.amount,c.first_name,c.last_name FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id ORDER BY p.amount DESC;

SELECT p.payment_date,p.amount,c.first_name,c.last_name FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id WHERE p.amount IS NOT NULL
ORDER BY p.amount DESC;

SELECT p.payment_date,p.amount,c.first_name,c.last_name FROM payment p 
JOIN customer c 
ON p.customer_id=c.customer_id WHERE (p.amount IS NOT NULL) AND (p.amount >= 10.99)
--AND (p.amount BETWEEN 10.99 AND 11.99)
ORDER BY p.amount DESC;



SELECT * FROM payment;
SELECT amount,payment_date FROM payment;
SELECT * FROM payment WHERE amount > 5;
SELECT SUM(amount) FROM payment;

SELECT customer_id,count(*) FROM payment GROUP BY customer_id ORDER BY customer_id DESC;
SELECT customer_id,count(*) FROM payment GROUP BY customer_id ORDER BY count DESC;
SELECT customer_id,count(*) as cnt FROM payment GROUP BY customer_id ORDER BY cnt DESC;
SELECT customer_id,count(*) cnt FROM payment GROUP BY customer_id ORDER BY cnt DESC;

/*column selection
where clause
alias
order by*/
SELECT p.customer_id,p.amount total_amount FROM payment p
WHERE total_amount IS NOT null -- ERROR:  column "total_amount" does not exist
ORDER BY total_amount DESC;

SELECT p.customer_id,p.amount total_amount FROM payment p
WHERE p.amount IS NOT null
ORDER BY total_amount DESC;


SELECT * FROM payment;
SELECT * FROM customer;
--Top 5 Customers paid maximum amount -> Send Thanks notes via email
--payment.amount, customer.first_name, customer.last_name, customer.email

SELECT * FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT * FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id;

SELECT p.customer_id,p.amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
ORDER BY p.customer_id;

SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id GROUP BY p.customer_id,c.first_name,c.last_name,c.email
ORDER BY total_amount ;


SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id GROUP BY p.customer_id,c.first_name,c.last_name,c.email
ORDER BY total_amount DESC;


SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
WHERE total_amount IS NOT null -- ERROR:  column "total_amount" does not exist
GROUP BY p.customer_id,c.first_name,c.last_name,c.email
ORDER BY total_amount DESC;
/*Sequence of execution of the above query-- 
Table joining
filtering - using where -- Some conditions (count/sum) we cannot add here 
column selection and aggregation along with group by
Having clause
column alias - names will change 
order by 
limit*/


SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
--WHERE SUM(p.amount) IS NOT null -- some conditions (count/sum) we cannot add here 
GROUP BY p.customer_id,c.first_name,c.last_name,c.email
ORDER BY total_amount DESC;

SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
--WHERE SUM(p.amount) IS NOT null -- some conditions (count/sum) we cannot add here 
GROUP BY p.customer_id,c.first_name,c.last_name,c.email
HAVING SUM(p.amount) IS NOT null 
ORDER BY total_amount DESC;


SELECT p.customer_id,SUM(p.amount) total_amount,c.first_name,c.last_name,c.email FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
--WHERE SUM(p.amount) IS NOT null -- some conditions (count/sum) we cannot add here 
GROUP BY p.customer_id,c.first_name,c.last_name,c.email
HAVING SUM(p.amount) IS NOT null 
ORDER BY total_amount DESC
LIMIT 5;



-- total_amount with respect to date
-- date, timestamp(date and timestamp)
select * FROM payment;
SELECT payment_date FROM payment ;
SELECT DATE(payment_date) FROM payment;
SELECT DATE(payment_date),* FROM payment;

SELECT * FROM payment
WHERE DATE(payment_date)='2007-02-16';

SELECT * FROM payment
WHERE DATE(payment_date)='2007-02-21';

SELECT DATE(payment_date),* FROM payment
WHERE DATE(payment_date) IN ('2007-02-16','2007-02-21','2007-02-14');



--- total_amount and Date(payment_date) --> from this I want the date with highest total_amount



SELECT * FROM rental ;

SELECT rental_id,DATE(rental_date) rental_dt, DATE(return_date) return_dt,customer_id FROM rental;

SELECT DATE(rental_date) ,DATE(return_date), DATE(return_date)-DATE(rental_date) FROM rental;

SELECT DATE(rental_date) rental_dt ,DATE(return_date) return_dt, DATE(return_date)-DATE(rental_date) duration FROM rental;

SELECT DATE(rental_date) rental_dt ,DATE(return_date) return_dt, DATE(return_date)-DATE(rental_date) duration,
rental_id,customer_id FROM rental;

-- filtering rental transactions with duration >= 10 days
SELECT DATE(rental_date) rental_dt ,DATE(return_date) return_dt, DATE(return_date)-DATE(rental_date) duration,
rental_id,customer_id FROM rental
WHERE DATE(return_date)-DATE(rental_date) >= 8;


SELECT DATE(return_date)-DATE(rental_date) duration,* FROM rental
WHERE DATE(return_date)-DATE(rental_date) = 0;

-- duration, rental_date, return_date, first_name,last_name, email of rental_transactions with duration > 7 days
SELECT * FROM rental
WHERE DATE(return_date)-DATE(rental_date) > 7;


--Customer name(full name) who has rented the item for long time
SELECT first_name,last_name,rental_date,return_date,return_date-rental_date AS rental_duration FROM customer c
JOIN rental r
ON c.customer_id=r.customer_id
ORDER BY rental_duration DESC;

SELECT first_name,last_name,rental_date,return_date,return_date-rental_date AS rental_duration FROM customer c
JOIN rental r
ON c.customer_id=r.customer_id
WHERE return_date-rental_date IS NOT null
ORDER BY rental_duration DESC; --LIMIT 2

SELECT first_name,last_name,rental_date,return_date,DATE(return_date)-DATE(rental_date) AS rental_duration FROM customer c
JOIN rental r
ON c.customer_id=r.customer_id
WHERE return_date-rental_date IS NOT null
ORDER BY rental_duration DESC; --LIMIT 2


SELECT * FROM inventory; -- inventory_id,film_id,store_id
SELECT * FROM payment; --payment_id,customer_id,staff_id,rental_id
SELECT * FROM rental; -- rental_id,inventory_id,customer_id

SELECT * FROM inventory i 
JOIN rental r 
ON i.inventory_id = r.inventory_id
JOIN payment p
ON r.customer_id = p.customer_id;



SELECT * FROM customer WHERE customer_id IS null;
SELECT * FROM payment;

SELECT * FROM payment p 
LEFT JOIN customer c
ON p.customer_id = c.customer_id ;


SELECT * FROM payment2 p 
LEFT JOIN customer c
ON p.customer_id = c.customer_id 
WHERE c.customer_id IS null;



-- to join inventory table and pasyment table there is no common column. 
-- So we have to identify a table which is having columns matching with both inventory and payment table.
SELECT * FROM inventory; -- inventory_id,film_id,store_id
SELECT * FROM payment; --payment_id,customer_id,staff_id,rental_id
SELECT * FROM rental; -- rental_id,inventory_id,customer_id,staff_id

SELECT * FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON p.customer_id = r.customer_id ;

SELECT * FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON p.customer_id = r.customer_id AND p.staff_id=r.staff_id;


----Customer name(full name) who has rented the item for long time

--SELECT * FROM film; -- identify the number of films for each rating. Along with that display the rental rate

SELECT title FROM film; --- LIMIT 1;
SELECT LEFT(title,1),title FROM film;

SELECT 'Bright Encounters' AS title;
SELECT 'Bright Encounters' ;

SELECT 'Bright Encounters' ;
SELECT LEFT('Bright Encounters',3);


SELECT ASCII('A')
--https://linuxhint.com/understanding-ascii-table/


SELECT ASCII('I');
SELECT ASCII('R'); --R-82, P-80, A-65
SELECT ASCII('APRIL');

SELECT CHR(73) -- i
SELECT CHR(90) -- Z
SELECT CHR(100) -- d

SELECT 1 + 1; -- adding integers

SELECT 'Hi ' || 'Welcome to ' || 'the class'; -- concatenating or adding strings
SELECT concat('Hi ' , 'Welcome to ' , 'the class');

SELECT * FROM film;
SELECT title || description FROM film;
SELECT title || ' - ' || description FROM film;
SELECT concat(title, ' - ' , description) FROM film;
SELECT title,description, concat(title, ' - ' , description) FROM film;

--https://www.postgresql.org/docs/9.1/functions-string.html
SELECT title,length(title),description,length(title) FROM film;

SELECT * FROM film;
SELECT title,description FROM film;
SELECT title,repeat(title,2) FROM film;
SELECT title,repeat(title,5) FROM film;
SELECT title,repeat(title,1) FROM film;
SELECT title,repeat(title,0) FROM film; -- result is ''

CREATE TABLE film2 AS SELECT * FROM film;

SELECT replace('A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', 'in','****')
SELECT replace('A Fateful Reflection of a Moose And in Husband who must Overcome IN Monkey in Nigeria', 'in','****')

SELECT replace('A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', 'a','1234')
SELECT replace('A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', ' a ','1234')
SELECT replace('A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', ' a ',' 1234 ')

SELECT * FROM film2;
SELECT title,description FROM film2;

SELECT description, replace(description,' a ',' 1234 ') FROM film2;
UPDATE film2 SET description = replace(description,' a ',' 1234 ') ; -- to change the data to new value



--https://www.postgresql.org/docs/9.1/functions-string.html



SELECT first_name,last_name,rental_date,return_date,return_date-rental_date AS rental_ageing 
FROM customer c JOIN rental r
ON c.customer_id=r.customer_id WHERE return_date-rental_date IS NOT null -- need to add date filters laters
ORDER BY first_name , last_name DESC LIMIT 100;

Select * from film;
SELECT rating FROM film WHERE rating = 'R';
SELECT COUNT (*) , rating FROM film GROUP BY rating ORDER BY rating;
SELECT COUNT(*) , rating, rental_rate FROM film GROUP BY rating , rental_rate 
ORDER BY rating, rental_rate ;


SELECT CONCAT(c.first_name, ' ', c.last_name) full_name, r.rental_date, r.return_date, 
(r.return_date - r.rental_date) rental_duration FROM rental r 
JOIN customer c
ON r.customer_id = c.customer_id
WHERE (r.return_date - r.rental_date) IS NOT NULL
--WHERE CONCAT(c.first_name, ' ', c.last_name) = 'Tommy Collazo'
ORDER BY rental_duration DESC 
--LIMIT 100;


SELECT CONCAT(c.first_name, ' ', c.last_name) full_name, r.rental_date, r.return_date, 
MAX(r.return_date - r.rental_date) max_rental_duration FROM rental r 
JOIN customer c
ON r.customer_id = c.customer_id
WHERE (r.return_date - r.rental_date) IS NOT NULL 
GROUP BY CONCAT(c.first_name, ' ', c.last_name),  r.rental_date, r.return_date
--GROUP BY c.first_name, c.last_name,  r.rental_date, r.return_date
ORDER BY max_rental_duration DESC ;


SELECT MAX(r.return_date-r.rental_date),r.return_date,r.rental_date
/*,r.customer_id,c.customer_id*/,c.first_name,c.last_name
FROM rental r 
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Jack' AND c.last_name = 'Foust'
GROUP BY r.return_date,r.rental_date,/*r.customer_id,c.customer_id,*/c.first_name,c.last_name;

-- correct query . To this you can add concat()
SELECT MAX(r.return_date-r.rental_date)/*,r.customer_id,c.customer_id*/,c.first_name,c.last_name
FROM rental r 
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.first_name = 'Jack' AND c.last_name = 'Foust'
GROUP BY /*r.customer_id,c.customer_id,*/c.first_name,c.last_name
--ORDER BY r.customer_id;



