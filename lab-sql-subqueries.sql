-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(*) AS num_copies FROM inventory inv
JOIN film film ON inv.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible';

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT film.title FROM film
WHERE film.length > (SELECT AVG(length) FROM film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor.first_name, actor.last_name FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'Alone Trip';


-- Bonus:

-- 4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.
SELECT film.title FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';

-- 5. Retrieve the name and email of customers from Canada using both subqueries and joins. 
-- To use joins, you will need to identify the relevant tables and their primary and foreign keys.
SELECT c.first_name, c.last_name, c.email
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

