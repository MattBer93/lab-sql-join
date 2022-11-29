use sakila;

-- List the number of films per category
select category_id, count(f.film_id)
from film f 
left join film_category fc
using(film_id)
group by category_id
order by category_id;

-- Display the first and the last names, as well as the address, of each staff member.
select first_name, last_name, address, address2
from staff s 
left join address a 
using(address_id);

-- Display the total amount rung up by each staff member in August 2005.
-- select substring(rental_date, 7, 1) from rental
-- where substring(rental_date, 7, 1) = 8;
select s.first_name, s.last_name, sum(p.amount)
from staff s
left join payment p 
using(staff_id)
right join rental r
using(customer_id)
where substring(rental_date, 7, 1) = 8
group by s.first_name, s.last_name;

-- List all films and the number of actors who are listed for each film.
select f.film_id, f.title, count(actor_id) as actors_count
from film f
right join film_actor fa
using(film_id) 
group by f.film_id, f.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id, c.last_name, c.first_name, sum(p.amount) as total_paid
from customer c
right join payment p
using(customer_id)
group by customer_id
order by c.last_name;

















