USE MurachCollege;

DECLARE @InstructorCount INT;
DECLARE @AnnualSalaryAvg       MONEY;

SELECT @InstructorCount = COUNT(*), @AnnualSalaryAvg = AVG(AnnualSalary)
FROM Instructors;

IF @InstructorCount >= 10
  BEGIN
    PRINT 'Instructor count: ' + CAST(@InstructorCount AS VARCHAR);
    PRINT 'Annual salary average: $' + CONVERT(VARCHAR, @AnnualSalaryAvg, 1);
  END;
ELSE
  BEGIN
    PRINT 'The number of instructors is less than 10.';
  END;