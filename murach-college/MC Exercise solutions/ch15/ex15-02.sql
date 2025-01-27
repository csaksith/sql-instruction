USE MurachCollege;

DROP FUNCTION IF EXISTS fnStudentUnits;
GO

CREATE FUNCTION fnStudentUnits
(
   @StudentID INT
)
RETURNS INT
BEGIN
  DECLARE @Units INT;
  
  SELECT @Units = SUM(CourseUnits)
  FROM StudentCourses sc
    JOIN Courses c
      ON sc.CourseID = c.CourseID
  WHERE StudentID = @StudentID
  GROUP BY StudentID;
  
  RETURN @Units;  
END;
GO

SELECT StudentID, CourseNumber, CourseUnits, 
       dbo.fnStudentUnits(StudentID) AS StudentUnits
FROM StudentCourses sc 
  JOIN Courses c
    ON sc.CourseID = c.CourseID;