--1.28.2025 murach college ch 6 exercises
--#1 Write a SELECT statement that returns the same result set as this SELECT statement, but don’t use a join. 
--Instead, use a subquery in a WHERE clause that uses the IN keyword
SELECT DISTINCT LastName, FirstName
	FROM Instructors I
	JOIN Courses C ON I.InstructorID=C.InstructorID
	ORDER BY LastName,FirstName

SELECT LastName, FirstName
	FROM Instructors I
	WHERE InstructorID IN
	(SELECT DISTINCT InstructorID
		FROM Courses C)
		ORDER BY LastName,FirstName
--#2 Write a SELECT statement that answers this question: Which instructors have an
--annual salary that’s greater than the average annual salary for all instructors?
--Return the LastName, FirstName, and AnnualSalary columns for each Instructor.
--Sort the result set by the AnnualSalary column in descending sequence.
SELECT LastName,FirstName, AnnualSalary
	FROM Instructors
	WHERE AnnualSalary >
	(SELECT AVG(AnnualSalary)
		FROM Instructors)
	ORDER BY AnnualSalary DESC
SELECT *
	FROM Instructors
--#3  Write a SELECT statement that returns the LastName and FirstName columns from the Instructors table.
-- Return one row for each instructor who doesn’t have any courses in the Courses table. 
--To do that, use a subquery with the NOT EXISTS operator.
--Sort the result set by LastName and then by FirstName
SELECT LastName, FirstName
	FROM Instructors I
	WHERE NOT EXISTS
		(SELECT *
			FROM Courses C WHERE C.InstructorID=I.InstructorID)
	ORDER BY LastName,FirstName

SELECT *
	FROM Instructors
SELECT *
	FROM Courses
--#4 Write a SELECT statement that returns the LastName and FirstName columns from
--the Students table, along with a count of the number of courses each student is taking
--from the StudentCourses table.
--Return one row for each student who is taking more than one class. To do that, use a
--subquery with the IN operator that groups the student course by StudentID.
--Group and sort the result set by the LastName and then by the FirstName
SELECT *
	FROM Students
SELECT *
	FROM StudentCourses
SELECT LastName, FirstName, COUNT(CourseID) AS 'Number of Courses'
	FROM Students S
	JOIN StudentCourses SC ON SC.StudentID=S.StudentID
	WHERE S.StudentID IN
		(SELECT StudentID
			FROM StudentCourses 
			GROUP BY StudentID
			HAVING COUNT(CourseID)>1)
	GROUP BY LastName,FirstName
	ORDER BY LastName, FirstName

--#5 Write a SELECT statement that returns the LastName, FirstName, and AnnualSalary
-- columns of each instructor who has a unique annual salary. In other words, don’t
-- include instructors who have the same annual salary as another instructor.
-- Sort the results by LastName and then by FirstName.
SELECT LastName, FirstName, AnnualSalary
	FROM Instructors I1
	WHERE NOT EXISTS
		(SELECT * 
			FROM Instructors I2
			WHERE I1.AnnualSalary=I2.AnnualSalary
			AND I1.InstructorID<>I2.InstructorID)
	ORDER BY LastName, FirstName
--#6 Write a SELECT statement that returns one row for each course. It should return these columns:
--The CourseID column from the Courses table
--The most recent enrollment date for that course
--Change the SELECT statement to a CTE. Then, write a SELECT statement that
--returns one row per course that shows the CourseDescription for the course and the
--LastName, FirstName, and EnrollmentDate for the student with the most recent enrollment data.

--#7Write a SELECT statement that returns one row for each student who has courses.
--It should return with these columns:
--The StudentID column from the Students table
--The sum of the course units for that student
--Include only those students who are taking more than 9 units (fulltime).
--Change the SELECT statement to a CTE. Then, write a SELECT statement that uses
--this CTE to return the student ID, sum of their course units, and their tuition. (The
--tuition is equal to the FullTimeCost column, plus the PerUnitCost column multiplied by the number of units.)
--(Hint: You can use a cross join to add the columns from the Tuition table to the
--query. This works because there’s only one row in the Tuition table.)