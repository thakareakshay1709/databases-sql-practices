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