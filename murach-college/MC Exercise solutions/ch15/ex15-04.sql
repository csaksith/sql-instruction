USE MurachCollege;

DROP PROC IF EXISTS spInsertInstructor;
GO

CREATE PROC spInsertInstructor
  @LastName              VARCHAR(25),
  @FirstName             VARCHAR(25),
  @Status                CHAR(1),
  @DepartmentChairman    BIT,
  @AnnualSalary          MONEY,
  @DepartmentID          INT
AS
  -- validate parameters
IF @AnnualSalary < 0
  THROW 50001, 'The annual salary must be a positive number.', 1;

INSERT INTO Instructors
  (LastName, FirstName, Status, DepartmentChairman,
   HireDate, AnnualSalary, DepartmentID)
VALUES
  (@LastName, @FirstName, @Status, @DepartmentChairman,
   GETDATE(), @AnnualSalary, @DepartmentID);

GO

-- Test fail: 
EXEC spInsertInstructor 'Collins', 'Linda', 'P', 0, -1, 7;
GO

-- Test success: 
EXEC spInsertInstructor 'Collins', 'Linda', 'P', 0, 33500, 7;
GO

-- Clean up: 
-- DELETE FROM Instructors WHERE InstructorID > 16;
-- GO

-- Check: 
-- SELECT LastName, FirstName, AnnualSalary FROM Instructors;