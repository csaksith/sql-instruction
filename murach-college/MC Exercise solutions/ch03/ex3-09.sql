SELECT LastName, FirstName, EnrollmentDate, GraduationDate
FROM Students
WHERE GraduationDate IS NULL AND EnrollmentDate > '2022-12-01';