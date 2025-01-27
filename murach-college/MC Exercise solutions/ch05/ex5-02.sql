SELECT DepartmentName, COUNT(*) AS InstructorCount, MAX(AnnualSalary) AS MaximumSalary
FROM Departments d
  JOIN Instructors i
    ON d.DepartmentID = i.DepartmentID
GROUP BY DepartmentName
ORDER BY InstructorCount DESC;