SELECT EnrollmentDate,  
    YEAR(EnrollmentDate) AS EnrollmentYear,
	DAY(EnrollmentDate) AS DayOnly,
	CAST(DATEADD(YEAR, 4, EnrollmentDate) AS CHAR(4)) AS GraduationYear
FROM Students;