WITH UnitsSummary AS
(
	SELECT s.StudentID, SUM(CourseUnits) AS TotalUnits
	FROM Students s
	  JOIN StudentCourses sc
	    ON s.StudentID = sc.StudentID
	  JOIN Courses c 
	    ON sc.CourseID = c.CourseID
	GROUP BY s.StudentID
	HAVING SUM(CourseUnits) > 9
)
SELECT StudentID, TotalUnits, FullTimeCost + (TotalUnits * PerUnitCost) AS Tuition
FROM UnitsSummary 
  CROSS JOIN Tuition;