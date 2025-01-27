	SELECT 'UNDERGRAD' AS Status, FirstName, LastName, EnrollmentDate, GraduationDate
	FROM Students
	WHERE GraduationDate IS NULL
UNION
	SELECT 'GRADUATED' AS Status, FirstName, LastName, EnrollmentDate, GraduationDate
	FROM Students
	WHERE GraduationDate IS NOT NULL
ORDER BY EnrollmentDate;