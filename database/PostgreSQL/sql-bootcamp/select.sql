--SELECT QUERY--:
=================


SELECT DISTINCT:
================


SELECT with WHERE clause:
=========================

select * from customer;

select * from customer where first_name = 'Mary';

select email from customer where first_name = 'Mary';

select * from customer where first_name = 'Jared' and last_name = 'Ely';

select first_name, last_name, email from customer where first_name = 'Karen';

select first_name, last_name, email from customer where customer_id = '50';

SELECT * FROM payment where staff_id = 2 and amount = 7.99;

select email from customer 
where first_name = 'Nancy' 
and last_name = 'Thomas';

select description, title from film;
select description from film where title = 'Outlaw Hanky';


select * from payment;
select * from payment where payment_id = 17504;

select * from payment where amount < 5.99 AND customer_id = 341;

COUNT Statement:
================
select * from payment;

select count(*) from payment;

SELECT COUNT(DISTINCT (amount)) FROM payment;

select amount from payment;

SELECT
 COUNT (DISTINCT amount)
FROM
 payment;


--LIMIT AND ORDER BY--:
=======================

select amount from payment 
ORDER BY amount asc limit 10;


select first_name, last_name from customer;

select first_name, last_name from customer order by first_name;

select first_name, last_name from customer order by first_name asc;

select first_name, last_name from customer order by first_name desc;

select first_name, last_name from customer order by first_name asc, last_name asc;

select first_name from customer order by last_name;

select customer_id, amount from payment order by amount desc limit 10;

select film_id, title, release_year from film order by film_id limit 5;


--BETWEEN, NOT BETWEEN --
==========================

SELECT customer_id, amount FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT customer_id, amount FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT customer_id, amount FROM payment
WHERE amount >= 10;


select payment_date from payment limit 5;

SELECT amount, payment_date FROM payment 
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';

--IN, NOT IN --
===============

select customer_id, rental_id,return_date
from rental
where customer_id IN (1,2)
order by return_date desc;

select customer_id, rental_id,return_date
from rental
where customer_id NOT IN (1,2)
order by return_date desc;

select customer_id, rental_id,return_date
from rental
where customer_id IN (7,8,9)
order by return_date desc;

select customer_id,rental_id,return_date
from rental
where customer_id = 7
or customer_id = 8
or customer_id = 9
order by return_date desc;

-- LIKE, NOT LIKE, ILIKE --
===========================
SELECT first_name,last_name
FROM customer
WHERE first_name LIKE 'Jen%';

SELECT first_name,last_name
FROM customer
WHERE first_name LIKE '%y';

SELECT first_name,last_name
FROM customer
WHERE first_name LIKE '%er%';

SELECT first_name,last_name
FROM customer
WHERE first_name LIKE '_her%';

SELECT first_name,last_name
FROM customer
WHERE first_name NOT LIKE 'Jen%';

SELECT first_name,last_name
FROM customer
WHERE first_name ILIKE 'bar%';

-- Challenge's Solution: --
===========================
SELECT COUNT(amount) FROM payment 
WHERE amount > 5;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district))
FROM address;

SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';

















