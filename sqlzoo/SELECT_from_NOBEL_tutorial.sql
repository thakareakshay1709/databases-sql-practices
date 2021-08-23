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
