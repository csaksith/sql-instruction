SELECT DepartmentName, CourseID
FROM Departments d
  FULL JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
WHERE c.DepartmentID IS NULL;