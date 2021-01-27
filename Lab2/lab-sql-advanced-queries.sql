use sakila;

-- List each pair of actors that have worked together.

select a.actor_id, a.first_name, a.last_name, count(*)
from actor a
join film_actor am on am.actor_id = a.actor_id
where film_id in (select film_id from film_actor)
group by a.actor_id
order by count(*) desc;


-- For each film, list actor that has acted in more films.
SELECT count(film_actor.actor_id), actor.first_name, actor.last_name 
FROM actor INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id ;

