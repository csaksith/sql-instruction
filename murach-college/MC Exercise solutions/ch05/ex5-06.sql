SELECT s.StudentID, SUM(CourseUnits) AS TotalUnits
FROM Students s
  JOIN StudentCourses sc
    ON s.StudentID = sc.StudentID
  JOIN Courses c
    ON sc.CourseID = c.CourseID
WHERE GraduationDate IS NULL
GROUP BY s.StudentID
HAVING SUM(CourseUnits) > 9
ORDER BY TotalUnits DESC;