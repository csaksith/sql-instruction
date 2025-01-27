USE MurachCollege;

IF OBJECT_ID('tempdb..#InstructorCopy') IS NOT NULL
	DROP TABLE #InstructorCopy;

SELECT * INTO #InstructorCopy
FROM Instructors
WHERE HireDate BETWEEN '2020-01-01' AND '2020-12-31'
  AND Status = 'P';

WHILE (SELECT AVG(AnnualSalary) FROM #InstructorCopy) < 40000
	BEGIN
		UPDATE #InstructorCopy
		SET AnnualSalary = AnnualSalary + 50
		WHERE AnnualSalary < 41000;
	End;

SELECT FirstName, LastName, AnnualSalary
FROM #InstructorCopy;