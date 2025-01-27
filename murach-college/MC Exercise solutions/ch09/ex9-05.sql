WITH UnitsSummary AS
(
    SELECT s.StudentID, SUM(CourseUnits) AS TotalUnits
    FROM Students s
      JOIN StudentCourses sc
        ON s.StudentID = sc.StudentID
      JOIN Courses c
        ON sc.CourseID = c.CourseID
    GROUP BY s.StudentID
)
SELECT StudentID, TotalUnits,
IIF(TotalUnits > 9, 'Fulltime', 'Parttime') AS Status,
IIF(TotalUnits > 9, FullTimeCost + (TotalUnits * PerUnitCost), PartTimeCost + (TotalUnits * PerUnitCost)) AS Tuition
FROM UnitsSummary 
  CROSS JOIN Tuition;