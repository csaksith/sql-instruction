SELECT DepartmentName, CourseDescription, LastName, FirstName
FROM Departments d
  JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
  JOIN StudentCourses sc
    ON c.CourseID = sc.CourseID
  JOIN Students s
    ON sc.StudentID = s.StudentID
WHERE DepartmentName = 'English'
ORDER BY CourseDescription;
