--1.27.2025 murach college ch 5 exercises
--#1 Write a SELECT statement that returns these columns:
-- The count of the number of instructors in the Instructors table
--The average of the AnnualSalary column in the Instructors table
--Include only those rows where the Status column is equal to “F” (Fulltime).
SELECT COUNT(*) AS 'Number of Instructors', AVG(AnnualSalary) AS 'Avg Annual Salary'
	FROM Instructors
	WHERE Status = 'F'

SELECT *
	FROM Instructors
SELECT*
	FROM Courses
SELECT *
	FROM Departments
--#2 Write a SELECT statement that returns one row for each department that has instructors. 
--The statement should return these columns:
--The DepartmentName column from the Departments table
--The count of the instructors in that department
--The annual salary of the highest paid instructor in that department
--Sort the result set so the department with the most instructors appears first
SELECT DepartmentName, COUNT(*) AS 'Number of Instructors', MAX(AnnualSalary) AS HighestAnnualSalary
	FROM Departments D
	JOIN Instructors I 
	ON I.DepartmentID=D.DepartmentID
	GROUP BY D.DepartmentName
	ORDER BY [Number of Instructors] DESC
--#3 Write a SELECT statement that returns one row for each instructor that has courses.
--The statement should return these columns:
--The instructor’s first and last names from the Instructors table in this format: 
--John Doe (Note: If the instructor first name has a null value, 
--the concatenation of the first and last name will result in a null value.)
--A count of the number of courses for each instructor
--The sum of the course units for each instructor
--Sort the result set in descending sequence by the total course units for each instructor.
--(Hint: You will need to concatenate the instructor first and last names again in the GROUP BY clause.)
SELECT FirstName + ' ' + LastName AS InstructorName, 
	   COUNT(*) AS 'Number of Courses',
	   SUM(CourseUnits) AS 'Sum of Course Units'
	   FROM Instructors I
	   JOIN Courses C
	   ON C.InstructorID=I.InstructorID
	   GROUP BY FirstName + ' ' + LastName
	   ORDER BY SUM(CourseUnits)