SELECT DepartmentName, CourseDescription, COUNT(*) AS Enrollment
FROM Departments d
  JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
  JOIN StudentCourses sc
    ON c.CourseID = sc.CourseID
GROUP BY DepartmentName, CourseDescription
ORDER BY DepartmentName, Enrollment DESC;
