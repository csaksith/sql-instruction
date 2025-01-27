Delete Instructors
WHERE InstructorID NOT IN
	(SELECT DISTINCT InstructorID FROM Courses);