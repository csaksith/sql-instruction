SELECT LastName, FirstName
FROM Instructors
WHERE InstructorID IN
	(SELECT DISTINCT InstructorID FROM Courses)
ORDER BY LastName, FirstName;