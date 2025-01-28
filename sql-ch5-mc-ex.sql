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
SELECT *
	FROM StudentCourses
SELECT *
	FROM Students
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
	   ORDER BY SUM(CourseUnits) DESC

--from solutions
SELECT FirstName + ' ' + LastName AS InstructorName, COUNT(*) AS NumberOfCourses, SUM(CourseUnits) AS TotalUnits
FROM Instructors i 
  JOIN Courses c
    ON i.InstructorID = c.InstructorID
GROUP BY FirstName + ' ' + LastName
ORDER BY TotalUnits DESC;
--#4 Write a SELECT statement that returns one row for each course that has students enrolled. 
--The statement should return these columns:
--The DepartmentName column from the Departments table
--The CourseDescription from the Courses table
--A count of the number of students in the course
--Sort the result set by DepartmentName, then by the enrollment for each course
SELECT DepartmentName, CourseDescription, COUNT(*) AS 'Number of Students'
	FROM Departments D
	JOIN Courses C
	ON C.DepartmentID=D.DepartmentID
	JOIN StudentCourses SC
	ON SC.CourseID=C.CourseID
	GROUP BY DepartmentName, CourseDescription
	ORDER BY DepartmentName, 'Number of Students' DESC
--#5 Write a SELECT statement that returns one row for each student that has courses.
--The statement should return these columns:
--The StudentID column from the Students table
--The sum of the course units for each student
--Sort the result set in descending sequence by the total course units for each student
SELECT S.StudentID, SUM(CourseUnits) AS SumCourseUnits
	FROM Students S
	JOIN StudentCourses SC
	ON SC.StudentID=S.StudentID
	JOIN Courses C
	ON C.CourseID=SC.CourseID
	GROUP BY S.StudentID
	ORDER BY SumCourseUnits DESC
--#6 Modify the solution to exercise 5 so it only includes students who haven’t graduated 
--and who are taking more than nine units
SELECT S.StudentID, SUM(C.CourseUnits) AS SumCourseUnits
	FROM Students S
	JOIN StudentCourses SC
	ON SC.StudentID=S.StudentID
	JOIN Courses C
	ON C.CourseID=SC.CourseID
	WHERE S.GraduationDate IS NULL
	GROUP BY S.StudentID
	HAVING SUM(C.CourseUnits)>9
	ORDER BY SumCourseUnits DESC
SELECT *
	FROM Instructors
SELECT*
	FROM Courses
SELECT *
	FROM Departments
SELECT *
	FROM StudentCourses
SELECT *
	FROM Students
-- from solution
SELECT s.StudentID, SUM(CourseUnits) AS TotalUnits
FROM Students s
  JOIN StudentCourses sc
    ON s.StudentID = sc.StudentID
  JOIN Courses c
    ON sc.CourseID = c.CourseID
WHERE GraduationDate IS NULL
GROUP BY s.StudentID
HAVING SUM(CourseUnits) > 9
ORDER BY TotalUnits DESC;
--#7 Write a SELECT statement that answers this question: What is the total number of
--courses taught by part-time instructors only? Return these columns:
--The instructor’s last name and first name from the Instructors table in
--this format: Doe, John (Note: If the instructor first name has a null value,
--the concatenation of the first and last name will result in a null value.)
--The total number of courses taught by each instructor
--Use the ROLLUP operator to include a row that gives the grand total.
SELECT LastName+', '+FirstName AS InstructorName, COUNT(C.CourseID) AS '# of Courses'
	FROM Instructors I
	JOIN Courses C
	ON C.InstructorID=I.InstructorID
	WHERE I.Status ='P'
	GROUP BY ROLLUP(LastName+', '+FirstName)

SELECT LastName + ', ' + FirstName AS InstructorName, COUNT(*) AS CourseCount
FROM Instructors i
  JOIN Courses c
    ON i.InstructorID = c.InstructorID
WHERE Status = 'P'
GROUP BY Rollup(LastName + ', ' + FirstName);
