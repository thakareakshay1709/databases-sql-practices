-- MYSQL
SELECT (MONTHS * SALARY) AS EARNINGS, COUNT(*) AS EARNINGS FROM EMPLOYEE GROUP BY 1 ORDER BY EARNINGS DESC LIMIT 1;
