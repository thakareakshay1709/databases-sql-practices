-- Self Join
--1. How many stops are in the database.
select count(*) from stops;

--2. Find the id value for the stop 'Craiglockhart'
select id from stops where name ='Craiglockhart';
