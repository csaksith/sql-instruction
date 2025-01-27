CREATE VIEW StudentCoursesMin
AS
SELECT FirstName, LastName, CourseNumber, CourseDescription, CourseUnits
FROM Students s
  JOIN StudentCourses sc
    ON s.StudentID = sc.StudentID
  JOIN Courses c
    ON sc.CourseID = c.CourseID;