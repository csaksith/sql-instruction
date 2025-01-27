SELECT DepartmentName, CourseDescription, FirstName, LastName
FROM Departments d
  JOIN Courses c 
    ON d.DepartmentID = c.DepartmentID
  JOIN Instructors i
    ON c.InstructorID = i.InstructorID
WHERE CourseUnits = 3
ORDER BY DepartmentName, CourseDescription;