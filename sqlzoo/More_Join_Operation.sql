--1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962;

--2. Give year of 'Citizen Kane'.
select yr from movie where title = 'Citizen Kane';
