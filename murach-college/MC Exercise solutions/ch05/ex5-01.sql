SELECT COUNT(*) AS InstructorCount, AVG(AnnualSalary) AS AverageSalary
FROM Instructors
WHERE Status = 'F';