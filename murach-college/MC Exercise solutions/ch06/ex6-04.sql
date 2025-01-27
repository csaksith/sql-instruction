SELECT LastName, FirstName, COUNT(*) AS NumberOfCourses
FROM Students s
  JOIN StudentCourses sc
    ON s.StudentID = sc.StudentID
WHERE sc.StudentID IN
	(SELECT StudentID
	FROM StudentCourses sc
	  JOIN Courses c
	    ON sc.CourseID = c.CourseID
	GROUP BY StudentID
	HAVING COUNT(*) > 1)
GROUP BY LastName, FirstName
ORDER BY LastName, FirstName;