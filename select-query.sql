
/* This is 
multi-line
comment
*/


-- To read entire table
SELECT * FROM customer;

-- To read few columns
SELECT customer_id, first_name, last_name, email FROM customer; 

SELECT  first_name, last_name, email,customer_id FROM customer; 

-- keywords in Upper case, table_name/Col_names in lower case
SELECT customer_id FROM customer;

-- To check no of rows in table
SELECT COUNT(*) FROM customer;
-- or 
SELECT COUNT(customer_id) FROM customer;

--- ORDER BY --> ASC | DESC
SELECT * FROM customer;
SELECT * FROM customer ORDER BY customer_id;
SELECT * FROM customer ORDER BY first_name;
SELECT * FROM customer ORDER BY first_name, last_name;

SELECT * FROM film_actor;
SELECT * FROM film_actor ORDER BY actor_id ASC;  
SELECT * FROM film_actor ORDER BY actor_id; -- by default ascending order
SELECT * FROM film_actor ORDER BY actor_id DESC;


--- WHERE
SELECT * FROM customer;
SELECT * FROM customer WHERE first_name = 'Tracy';
SELECT * FROM customer WHERE first_name = 'Kelly';
SELECT * FROM customer WHERE customer_id = 400;

SELECT * FROM customer WHERE customer_id IN (1, 4, 10);
SELECT * FROM customer WHERE first_name IN ('Tracy', 'Kelly', 'Mary', 'Barbara');

SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name IN ('Tracy', 'Kelly', 'Mary', 'Barbara');


SELECT customer_id, first_name, last_name, email FROM customer 
WHERE first_name IN ('Vijaya');









-- Will be explained later -- Using to retrieve data
SELECT count(*) as cnt, first_name FROM customer GROUP BY first_name ORDER BY cnt DESC;

/*
2	"Tracy"
2	"Kelly"
2	"Leslie"
*/












