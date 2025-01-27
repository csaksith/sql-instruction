USE MurachCollege;

DROP TRIGGER IF EXISTS Instructors_UPDATE;
GO

CREATE TRIGGER Instructors_UPDATE
  ON Instructors
  AFTER UPDATE 
AS

IF (SELECT AnnualSalary FROM inserted) >= 120000
  THROW 50001, 'The annual salary must be less than 120000.', 1;

IF (SELECT AnnualSalary FROM inserted) < 0
  THROW 50001, 'The annual salary must be a positive number.', 1;

IF (SELECT AnnualSalary FROM inserted) >=0 AND 
   (SELECT AnnualSalary FROM inserted) < 12000
      UPDATE Instructors
      SET AnnualSalary = (SELECT AnnualSalary FROM inserted) * 12
      WHERE InstructorID = (SELECT InstructorID FROM inserted);

GO

-- fire trigger
UPDATE Instructors
SET AnnualSalary = 7500
WHERE InstructorID = 1;
GO

-- check results
-- SELECT InstructorID, AnnualSalary FROM Instructors;
-- GO

-- Clean up: 
/*
UPDATE Instructors 
SET AnnualSalary = 77500
WHERE InstructorID = 1;
*/