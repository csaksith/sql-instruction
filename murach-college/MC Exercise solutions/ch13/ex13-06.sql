CREATE VIEW StudentCoursesSummary
AS
SELECT LastName, FirstName,
	COUNT(CourseNumber) AS CourseCount,
	SUM(CourseUnits) AS UnitsTotal
FROM StudentCoursesMin
GROUP BY LastName, FirstName
HAVING SUM(CourseUnits) > 9;