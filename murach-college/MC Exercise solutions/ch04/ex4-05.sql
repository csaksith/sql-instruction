SELECT LastName, FirstName, CourseDescription
FROM Instructors i
  LEFT JOIN Courses c
    ON i.InstructorID = c.InstructorID
ORDER BY LastName, FirstName;