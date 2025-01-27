SELECT DepartmentName, CourseNumber, CourseDescription
FROM Departments JOIN Courses
ON Departments.DepartmentID = Courses.DepartmentID
ORDER BY DepartmentName, CourseNumber;