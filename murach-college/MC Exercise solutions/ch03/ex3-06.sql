SELECT FirstName, LastName, EnrollmentDate,
       GETDATE() AS CurrentDate,
	   DATEDIFF(month, EnrollmentDate, GETDATE()) AS MonthsAttended
FROM Students
ORDER BY MonthsAttended;