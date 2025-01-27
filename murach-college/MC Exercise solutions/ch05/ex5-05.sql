SELECT s.StudentID, SUM(CourseUnits) AS TotalUnits
FROM Students s
  JOIN StudentCourses sc
    ON s.StudentID = sc.StudentID
  JOIN Courses c 
    ON sc.CourseID = c.CourseID
GROUP BY s.StudentID
ORDER BY TotalUnits DESC;