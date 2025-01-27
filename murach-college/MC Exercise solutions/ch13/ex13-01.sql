CREATE VIEW DepartmentInstructors
AS
SELECT DepartmentName, LastName, FirstName, Status, AnnualSalary
FROM Departments d
  JOIN Instructors i
    ON d.DepartmentID = i.DepartmentID;