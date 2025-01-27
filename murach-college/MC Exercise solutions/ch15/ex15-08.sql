USE MurachCollege;

-- After you create the InstructorsAudit table, you can comment out the code that creates it
DROP TABLE IF EXISTS InstructorsAudit;
GO

CREATE TABLE InstructorsAudit (
  AuditID               INT            PRIMARY KEY IDENTITY,
  InstructorID          INT            NOT NULL,
  LastName              VARCHAR(25)    NOT NULL,
  FirstName             VARCHAR(25)    NOT NULL,
  Status                CHAR(1)        NOT NULL,
  DepartmentChairman    BIT            NOT NULL,
  HireDate              DATE           NULL,
  AnnualSalary          MONEY          NOT NULL,
  DepartmentID          INT            NOT NULL,
  DateUpdated           DATETIME2      DEFAULT NULL
);
GO

DROP TRIGGER IF EXISTS Instructors_UPDATE_AUDIT;
GO

CREATE TRIGGER Instructors_UPDATE_AUDIT
  ON Instructors
  AFTER UPDATE
AS
  INSERT INTO InstructorsAudit 
    (InstructorID, LastName, FirstName, Status, DepartmentChairman,
     HireDate, AnnualSalary, DepartmentID, DateUpdated)
  VALUES(
    (SELECT InstructorID FROM deleted), 
    (SELECT LastName FROM deleted), 
    (SELECT FirstName FROM deleted), 
    (SELECT Status FROM deleted),
	(SELECT DepartmentChairman FROM deleted),
    (SELECT HireDate FROM deleted), 
    (SELECT AnnualSalary FROM deleted),
	(SELECT DepartmentID FROM deleted),
     GETDATE());

GO

-- test
UPDATE Instructors
SET AnnualSalary = 81500
WHERE InstructorID = 1;

-- check
-- SELECT * FROM InstructorsAudit;

-- clean up
-- UPDATE Instructors
-- SET AnnualSalary = 75500
-- WHERE InstructorID = 1;