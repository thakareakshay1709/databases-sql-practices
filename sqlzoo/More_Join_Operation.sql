--1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962;

--2. Give year of 'Citizen Kane'.
select yr from movie where title = 'Citizen Kane';

--3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr from movie
where title like '%Star Trek%'
order by yr;

--4. What id number does the actor 'Glenn Close' have?
select id from actor where name ='Glenn Close';

--5. What is the id of the film 'Casablanca'
select id from movie where title like 'Casablanca';

--6. Obtain the cast list for 'Casablanca'.
-- what is a cast list?
-- Use movieid=11768, (or whatever value you got from the previous question)
select name from actor
where id in (select actorid from casting where movieid='11768');

--7. Obtain the cast list for the film 'Alien'
select name from actor
where id in 
(select actorid from casting where movieid in
(select id from movie where title ='Alien'));

--8. List the films in which 'Harrison Ford' has appeared
select title from movie
where id in (select movieid from casting 
where actorid in 
(select id from actor where name ='Harrison Ford')
);

--9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select title from movie
where id in (select movieid from casting 
where actorid in 
(select id from actor where name ='Harrison Ford')
and ord !=1);

--10. List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE movie.yr = 1962
AND casting.ord = 1;

--11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr, COUNT(title) as number_of_movies FROM
    movie JOIN casting ON movie.id=movieid
          JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2;

--12. Lead actor in Julie Andrews movies
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews');

--13. Actors with 15 leading roles
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor
JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name;

--14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title
SELECT title, COUNT(actorid) 
FROM movie JOIN casting ON movie.id = movieid 
WHERE yr = 1978
GROUP BY title ORDER BY COUNT(actorid) DESC, title