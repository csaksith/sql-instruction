USE MurachCollege;

DROP FUNCTION IF EXISTS fnTuition;
GO

CREATE FUNCTION fnTuition 
  (@StudentID INT)
  RETURNS MONEY
BEGIN
  DECLARE @Tuition MONEY;
  
  SELECT @Tuition = IIF(dbo.fnStudentUnits(StudentID) > 9,
	FullTimeCost + (dbo.fnStudentUnits(StudentID) * PerUnitCost),
	PartTimeCost + (dbo.fnStudentUnits(StudentID) * PerUnitCost))
  FROM Students CROSS JOIN Tuition
  WHERE StudentID = @StudentID;
  
  RETURN @Tuition;  
END;
GO

SELECT StudentID, dbo.fnStudentUnits(StudentID) AS TotalUnits, 
       dbo.fnTuition(StudentID) AS Tuition
FROM Students
WHERE dbo.fnStudentUnits(StudentID) > 0;