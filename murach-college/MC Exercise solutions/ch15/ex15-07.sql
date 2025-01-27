USE MurachCollege;

DROP TRIGGER IF EXISTS Instructors_INSERT;
GO

CREATE TRIGGER Instructors_INSERT
  ON Instructors
  AFTER INSERT 
AS
IF (SELECT HireDate FROM inserted) IS NULL
  UPDATE Instructors
  SET HireDate = GETDATE()
  WHERE InstructorID = (SELECT InstructorID FROM inserted);

GO

-- Test
INSERT INTO Instructors 
  (LastName, FirstName, Status, DepartmentChairman, AnnualSalary, DepartmentID)
VALUES
  ('Collins', 'Linda', 'P', 0, 33500, 7);

-- Check
-- SELECT InstructorID, HireDate FROM Instructors;

-- Clean up
-- DELETE FROM Instructors WHERE InstructorID > 16;
-- GO