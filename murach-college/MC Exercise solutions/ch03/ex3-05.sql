SELECT LastName, FirstName, HireDate
FROM Instructors
WHERE HireDate BETWEEN '2022-01-01' AND '2022-12-31'
ORDER BY HireDate;