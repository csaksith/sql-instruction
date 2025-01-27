SELECT AnnualSalary, 
	AnnualSalary / 12 AS MonthlySalary,
	ROUND(AnnualSalary / 12, 2) AS MonthlySalaryRounded
FROM Instructors;