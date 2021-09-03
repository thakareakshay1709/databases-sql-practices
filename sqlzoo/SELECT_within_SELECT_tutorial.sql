-- 1. List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world 
WHERE population > (SELECT population FROM world WHERE name='Russia');

--2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world where 
gdp/population > (select gdp/population from world where name ='United Kingdom') and continent like 'Europe';

--3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT NAME, CONTINENT FROM world
WHERE CONTINENT IN 
(SELECT CONTINENT FROM world WHERE NAME IN ('Argentina', 'Australia'))
ORDER BY NAME;

--4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT NAME, POPULATION FROM world
WHERE POPULATION > 
(SELECT POPULATION FROM world 
WHERE NAME = 'Canada')
AND
POPULATION < 
(SELECT POPULATION FROM world 
WHERE NAME = 'Poland');

--5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
--Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.


SELECT NAME, CONCAT(ROUND((POPULATION*100)/(SELECT POPULATION FROM world WHERE NAME = 'Germany'),0),'%') AS percentage FROM world
WHERE POPULATION in (
SELECT POPULATION FROM world
WHERE CONTINENT = 'Europe');

--6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT NAME FROM world 
WHERE GDP > ALL(
SELECT GDP FROM world
WHERE CONTINENT = 'Europe' and GDP > 0);

--7. Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y WHERE y.continent=x.continent and area>0);

--8. List each continent and the name of the country that comes first alphabetically.

SELECT x.CONTINENT, x.NAME FROM world x
WHERE x.NAME <= ALL(SELECT y.NAME FROM world y
WHERE x.continent = y.continent);