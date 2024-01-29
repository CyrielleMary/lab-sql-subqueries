-- Write SQL queries to perform the following tasks using the Sakila database:
USE sakila;

-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT * FROM inventory;

SELECT f.title, COUNT(i.inventory_id) as inventory
FROM sakila.inventory i
JOIN sakila.film f
ON i.film_id = f.film_id
WHERE f.title = "Hunchback Impossible"
GROUP BY i.film_id;

SELECT COUNT(inventory_id) AS inventory FROM inventory
WHERE film_id IN (
	SELECT film_id 
    FROM film
    WHERE title = "Hunchback Impossible"
    );

-- List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT avg(length) FROM film;

SELECT title, length as duration FROM film
WHERE length > (SELECT avg(length) FROM film)
ORDER BY length ASC;

-- Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT first_name, last_name FROM actor
WHERE actor_id IN(
	SELECT fa.actor_id FROM film_actor fa
     WHERE fa.film_id IN (
		SELECT f.film_id FROM film f
        WHERE f.title = "Alone Trip")
        )
ORDER BY last_name ASC;



-- Bonus:

-- Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.

-- Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.

-- Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. 
-- First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.

-- Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.

-- Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. You can use subqueries to accomplish this.