SELECT LastName, FirstName, CourseNumber, CourseDescription
FROM Instructors JOIN Courses
ON Instructors.InstructorID = Courses.InstructorID
WHERE Status = 'P'
ORDER BY LastName, FirstName;