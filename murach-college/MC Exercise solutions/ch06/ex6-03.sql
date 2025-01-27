SELECT LastName, FirstName
FROM Instructors i
WHERE NOT EXISTS
	(SELECT *
	 FROM Courses
	 WHERE InstructorID = i.InstructorID)
ORDER BY LastName, FirstName;