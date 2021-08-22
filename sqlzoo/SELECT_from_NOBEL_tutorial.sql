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