-- MYSQL
SELECT SUM(CITY.POPULATION) FROM COUNTRY,CITY WHERE COUNTRY.CONTINENT = 'Asia'
AND COUNTRY.CODE = CITY.COUNTRYCODE;

