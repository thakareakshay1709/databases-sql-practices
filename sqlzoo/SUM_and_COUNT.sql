--1. Show the total population of the world
SELECT SUM(population) FROM world;

--2. List all the continents - just once each.
select distinct continent from world;

--3. Give the total GDP of Africa
select sum(GDP) from world
where continent = 'Africa';

--4. How many countries have an area of at least 1000000
select count(name) from world
where area > '1000000';

--5. Baltic states population | What is the total population of ('Estonia', 'Latvia', 'Lithuania')
select sum(population) from world
where name in ('Estonia', 'Latvia', 'Lithuania');