SELECT LastName, FirstName, AnnualSalary
FROM Instructors
WHERE AnnualSalary NOT IN
	(SELECT AnnualSalary
	 FROM Instructors
	 GROUP BY AnnualSalary
	 HAVING COUNT(AnnualSalary) > 1)
ORDER BY LastName, FirstName;