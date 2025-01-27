SELECT FirstName + ' ' + LastName AS InstructorName, COUNT(*) AS NumberOfCourses, SUM(CourseUnits) AS TotalUnits
FROM Instructors i 
  JOIN Courses c
    ON i.InstructorID = c.InstructorID
GROUP BY FirstName + ' ' + LastName
ORDER BY TotalUnits DESC;