--1.28.2025 ch4 mc ex practice
--#1 Write a SELECT statement that joins the Courses table to the Departments table and
--returns these columns: DepartmentName, CourseNumber, CourseDescription.
--Sort the result set by DepartmentName and then by CourseNumber in ascending order.
SELECT *
	FROM Courses
SELECT *
	FROM Departments

SELECT DepartmentName, CourseNumber, CourseDescription
	FROM Departments D
	JOIN Courses C
	ON C.DepartmentID=D.DepartmentID
	ORDER BY DepartmentName, CourseNumber 
--#2 Write a SELECT statement that joins the Instructors table to the Courses table and
--returns these columns: LastName, FirstName, CourseNumber, CourseDescription.
--Return all courses for each instructor with a status of “P” (part time).
--Sort the result set by LastName and then by FirstName in ascending order
SELECT *
	FROM Courses
SELECT *
	FROM Instructors
SELECT LastName, FirstName, CourseNumber, CourseDescription
	FROM Instructors I
	JOIN Courses C
	ON C.InstructorID=I.InstructorID
	WHERE Status='P'
	ORDER BY LastName, FirstName
--#3 Write a SELECT statement that joins the Departments, Courses, and Instructors tables. 
--This statement should return these columns: 
--DepartmentName, CourseDescription, FirstName, and LastName.
--Use aliases for the tables, and return only those courses with three units.
--Sort the result set by DepartmentName and then by CourseDescription in ascending sequence
SELECT *
	FROM Courses
SELECT *
	FROM Instructors
SELECT *
	FROM Departments
SELECT DepartmentName, CourseDescription, FirstName, LastName
	FROM Departments D
	JOIN Courses C
	ON C.DepartmentID=D.DepartmentID
	JOIN Instructors I
	ON I.InstructorID=C.InstructorID
	WHERE CourseUnits=3
	ORDER BY DepartmentName, CourseDescription
--#4 Write a SELECT statement that joins the Departments, Courses, StudentCourses, and Students tables. 
--This statement should return these columns: 
--DepartmentName, CourseDescription, LastName, and FirstName.
--Return all courses in the English department.
--Sort the result set by CourseDescription in ascending sequence.
SELECT *
	FROM Courses
SELECT *
	FROM Students
SELECT *
	FROM StudentCourses
SELECT *
	FROM Departments
SELECT DepartmentName, CourseDescription, LastName, FirstName
	FROM Departments D
	JOIN Courses C
	ON C.DepartmentID=D.DepartmentID
	JOIN StudentCourses SC
	ON SC.CourseID=C.CourseID
	JOIN Students S
	ON S.StudentID=SC.StudentID
	WHERE DepartmentName='English'
	ORDER BY CourseDescription

--#5 Write a SELECT statement that joins the Instructors and Courses tables and
--returns these columns: LastName, FirstName, and CourseDescription.
--Return at least one row for each instructor, even if that instructor isn’t teaching any courses.
--Sort the result set by LastName and then by FirstName.

SELECT *
	FROM Courses
SELECT *
	FROM Instructors
SELECT LastName,FirstName,CourseDescription
	FROM Instructors I
	JOIN Courses C
	ON C.InstructorID=I.InstructorID
	ORDER BY LastName,FirstName