-- MYSQL
SELECT DISTINCT(CITY) FROM STATION WHERE ID % 2 = 0;

/*ORACLE*/
SELECT DISTINCT(CITY) FROM STATION WHERE mod(ID,2) = 0;