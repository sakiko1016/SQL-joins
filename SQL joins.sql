--1. List all customers who live in Texas (use
JOINs)

SELECT address.address_id, COUNT(address_id)
FROM address
JOIN customer ON customer.address_id = address.address_id
WHERE address.district  = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full
Name

SELECT customer.first_name, last_name, payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use
subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE payment.amount > 175
);

--4. List all customers that live in Nepal (use the city
table)

SELECT customer.customer_id, customer.first_name, customer.address_id
FROM customer
JOIN city ON customer.address_id = city.city_id
WHERE city.city = 'Nepal';

--5. Which staff member had the most
transactions?

SELECT COUNT(amount) 
FROM sale_invoice 
GROUP BY salesperson_id
ORDER BY amount desc

--6. How many movies of each rating are
there?

SELECT reviewes, COUNT(*) AS movie_count
FROM movies
GROUP BY reviewes;

--7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)

SELECT c.customerName
FROM customers c
WHERE c.customerNumber IN (
    SELECT p.customerNumber
    FROM payments p
    WHERE p.amount > 6.99
    GROUP BY p.customerNumber
    HAVING COUNT(*) = 1
);


--how many free rentals did our store give away?

SELECT COUNT(*) AS free_rental_count
FROM rental
WHERE return_date = 0

select * from rental