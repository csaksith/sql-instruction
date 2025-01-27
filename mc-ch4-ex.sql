-- 1.27.2025 
-- Class demo of MurachCollege ch 4 #8
-- 4  table join
--Write a SELECT statement that returns these columns:
--InstructorDept The DepartmentName column from the Departments table for an instructor 
--LastName The LastName column from the Instructors table
--FirstName The FirstName column from the Instructors table
--CourseDescription The CourseDescription column from the Courses table
-- CourseDept The DepartmentName column from the Departments table for a course

--Return one row for each course that’s in a different department
--of the instructor assigned to teach that course. (Hint: You will n
--Departments table to both the Instructors table and the Courses
--require you to use table aliases to distinguish the two tables.)

-- 3 tables: departments, instructors, courses
	-- how are these tables related
	--course--> departments, courses-->instructor, instructors-->departments
	--use department table twice
 SELECT *
	FROM Departments;
SELECT *
	FROM Instructors;
SELECT *
	FROM Courses;

SELECT *
	FROM Courses
	ORDER BY InstructorID;

SELECT CourseDescription,
	   D1.DepartmentName AS CourseDept, 
	   D2.DepartmentName AS InstructorDept,
	   LastName +', '+FirstName AS InstructorName
	   -- don't need to include I in front because instructor name is only included in Instructors database
	   FROM Courses C
	JOIN Departments D1 ON C.DepartmentID=D1.DepartmentID
	JOIN Instructors I ON C.InstructorID=I.InstructorID
	JOIN Departments D2 ON I.DepartmentID=D2.DepartmentID
	WHERE D1.DepartmentID<>D2.DepartmentID;
--where the course dept is not the same as instructor dept

--any instructors who aren't assigned a course?
SELECT LastName +', '+FirstName AS InstructorName, CourseDescription
	FROM Instructors I
	LEFT JOIN Courses C ON I.InstructorID=C.InstructorID
	WHERE CourseDescription IS NULL

