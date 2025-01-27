SELECT AnnualSalary / 12 AS MonthlySalary,
       CAST(AnnualSalary / 12 AS decimal(9,1)) AS MonthlySalary1,
       CONVERT(int, AnnualSalary / 12) AS MonthlySalary2, 
       CAST(AnnualSalary / 12 AS int) AS MonthlySalary3
FROM Instructors;
