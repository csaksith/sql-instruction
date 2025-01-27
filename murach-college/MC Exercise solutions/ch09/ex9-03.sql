SELECT DepartmentName, CourseNumber, FirstName, LastName,
    UPPER(LEFT(DepartmentName, 3)) + 
	CAST(CourseNumber AS CHAR(5)) + IIF(FirstName IS NOT NULL, LEFT(FirstName, 1), '') + LastName AS CourseCode
FROM Departments d
  JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
  JOIN Instructors i
    ON c.InstructorID = i.InstructorID;