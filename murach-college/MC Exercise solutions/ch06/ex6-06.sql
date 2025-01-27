WITH CourseSummary AS
(
	SELECT c.CourseID, MAX(EnrollmentDate) AS MaxEnrollmentDate
	FROM Courses c
	  JOIN StudentCourses sc 
	    ON c.CourseID = sc.CourseID
	  JOIN Students s 
	    ON sc.StudentID = s.StudentID
	GROUP BY c.CourseID
)
SELECT CourseDescription, LastName, FirstName, EnrollmentDate
FROM Courses c
  JOIN StudentCourses sc 
    ON c.CourseID = sc.CourseID
  JOIN Students s 
    ON sc.StudentID = s.StudentID
  JOIN CourseSummary cs 
    ON c.CourseID = cs.CourseID AND
       s.EnrollmentDate = cs.MaxEnrollmentDate
