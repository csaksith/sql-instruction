USE MurachCollege;

DROP PROC IF EXISTS spInsertDepartment;
GO

CREATE PROC spInsertDepartment
  @DepartmentName VARCHAR(255)
AS
  INSERT INTO Departments (DepartmentName)
  VALUES (@DepartmentName);

GO

-- Test fail: 
EXEC spInsertDepartment 'English';
GO

-- Test success: 
EXEC spInsertDepartment 'New Department';
GO

-- Clean up: 
-- DELETE FROM Departments WHERE DepartmentID > 8;
-- GO