SELECT LastName, FirstName, AnnualSalary
FROM Instructors
WHERE AnnualSalary >
	(SELECT AVG(AnnualSalary) FROM Instructors)
ORDER BY AnnualSalary DESC;