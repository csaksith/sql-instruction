INSERT INTO GradStudents
SELECT *
FROM Students
WHERE GraduationDate IS NOT NULL;