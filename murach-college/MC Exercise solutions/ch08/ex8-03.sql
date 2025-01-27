SELECT EnrollmentDate, 
    CONVERT(varchar, EnrollmentDate, 1) AS ShortDate,
	CONVERT(varchar, EnrollmentDate, 100) AS LongDatetime, 
    CONVERT(varchar, EnrollmentDate, 14) AS Time,
	CONVERT(char(7), EnrollmentDate, 0) AS MonthDay
FROM Students;