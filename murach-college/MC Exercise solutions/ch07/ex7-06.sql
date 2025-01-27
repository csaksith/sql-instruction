UPDATE Instructors
SET AnnualSalary = AnnualSalary + (AnnualSalary * .05)
FROM Instructors i
  JOIN Departments d
	ON i.DepartmentID = d.DepartmentID
WHERE DepartmentName = 'Education';