SELECT id.DepartmentName AS InstructorDept, LastName, FirstName,
	CourseDescription, cd.DepartmentName AS CourseDept
FROM Departments id
  JOIN Instructors i
    ON id.DepartmentID = i.DepartmentID
  JOIN Courses c 
    ON i.InstructorID = c.InstructorID
  JOIN Departments cd 
    ON c.DepartmentID = cd.DepartmentID
WHERE i.DepartmentID <> c.DepartmentID;