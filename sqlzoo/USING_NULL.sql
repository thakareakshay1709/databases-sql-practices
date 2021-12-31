-- NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN

-- 1. List the teachers who have NULL for their department.
-- Why we cannot use =
-- You might think that the phrase dept=NULL would work here but it doesn't - you can use the phrase dept IS NULL

select NAME from teacher where dept IS NULL;

--2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id);
