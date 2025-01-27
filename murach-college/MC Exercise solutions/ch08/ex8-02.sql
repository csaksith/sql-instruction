SELECT EnrollmentDate, 
       CAST(EnrollmentDate AS DATE) AS DateEnrolled, 
       CAST(EnrollmentDate AS TIME) AS TimeEnrolled, 
       CONVERT(CHAR(7), EnrollmentDate, 0) AS MonthDayEnrolled
FROM Students;