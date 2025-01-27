USE MurachCollege;

DROP PROC IF EXISTS spUpdateInstructorSalary;
GO

CREATE PROC spUpdateInstructorSalary
  @InstructorID    INT,
  @AnnualSalary    MONEY
AS
-- validate parameters
IF @AnnualSalary < 0
  THROW 50001, 'The annual salary must be a positive number.', 1;  

UPDATE Instructors
SET AnnualSalary = @AnnualSalary
WHERE InstructorID = @InstructorID;

GO

-- Test fail: 
EXEC spUpdateInstructorSalary 1, -81500;
GO

-- Test success: 
EXEC spUpdateInstructorSalary 1, 81500;
GO

-- Check
--SELECT InstructorID, AnnualSalary FROM Instructors;

-- Clean up: 
/*
UPDATE Instructors 
SET AnnualSalary = 77500
WHERE InstructorID = 1;
*/