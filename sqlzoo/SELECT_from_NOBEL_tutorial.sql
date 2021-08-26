-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT YR, SUBJECT, WINNER
FROM NOBEL
WHERE YR = 1950;

--2. Show who won the 1962 prize for Literature.
SELECT WINNER
FROM NOBEL
WHERE yr = 1962
AND subject = 'Literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT YR, SUBJECT
FROM NOBEL
WHERE WINNER = 'Albert Einstein';

-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT WINNER
FROM NOBEL
WHERE YR >= 2000
AND SUBJECT = 'Peace';

--5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive
SELECT YR, SUBJECT, WINNER
FROM NOBEL
WHERE SUBJECT = 'Literature'
AND YR >= 1980 AND YR <=1989;

--6. Show all details of the presidential winners:
--Theodore Roosevelt
--Woodrow Wilson
--Jimmy Carter
--Barack Obama

SELECT * FROM NOBEL
WHERE WINNER IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

--7. Show the winners with first name John
SELECT WINNER FROM NOBEL
WHERE WINNER LIKE 'John%';

--8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT YR, SUBJECT, WINNER
FROM NOBEL
WHERE (YR = '1980' AND SUBJECT = 'Physics') 
OR
(YR = '1984' AND SUBJECT = 'Chemistry');

--9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT YR, SUBJECT, WINNER FROM NOBEL
WHERE YR = '1980'
AND SUBJECT NOT IN ('Chemistry', 'Medicine');

--10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT YR, SUBJECT, WINNER 
FROM NOBEL
WHERE (SUBJECT = 'Medicine' AND YR < '1910')
OR
(SUBJECT = 'Literature' AND YR >= '2004');

--11. Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM NOBEL
WHERE WINNER = 'PETER GRÜNBERG';

--12. 
--Find all details of the prize won by EUGENE O'NEILL
--Escaping single quotes
--You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.

SELECT * FROM NOBEL
WHERE WINNER = 'EUGENE O''NEILL';

--13.Knights in order
--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT WINNER, YR, SUBJECT
FROM NOBEL
WHERE WINNER LIKE 'Sir%'
ORDER BY YR DESC, WINNER ASC;

--14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
--Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last

SELECT WINNER, SUBJECT
FROM NOBEL
WHERE YR=1984
ORDER BY SUBJECT IN ('Physics','Chemistry'),SUBJECT,WINNER;