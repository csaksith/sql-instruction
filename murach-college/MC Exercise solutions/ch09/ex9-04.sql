SELECT FirstName, LastName, EnrollmentDate, GraduationDate,
DATEDIFF(MONTH, EnrollmentDate, GraduationDate) AS MonthsEnrolled
FROM Students
WHERE GraduationDate IS NOT NULL
ORDER BY MonthsEnrolled;