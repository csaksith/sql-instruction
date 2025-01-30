--1.29.2025 murach college ch 7 exercises
--#1 Write an INSERT statement that adds a row to the Departments table for a department named “History”.
-- (Hint: Remember that you do not need to specify a value for identity columns.)
INSERT INTO Departments
	VALUES
	('History')

SELECT *
	FROM Departments
SELECT *
	FROM Instructors

--#2 Write a single INSERT statement that adds two rows to the Instructors table with the following values: 
INSERT INTO Instructors
VALUES ('Benedict', 'Susan', 'P',0,GETDATE(),34000,9),
	   ('Adams',NULL,'F',1,GETDATE(),66000,9)
--#3 Write an UPDATE statement that changes the AnnualSalary column for Susan
--Benedict (the first instructor you added in exercise 2) from 34,000 to 35,0000. To
--identify the row, use the InstructorID column
UPDATE Instructors
	SET AnnualSalary=35000
	WHERE InstructorID=17
--#4 Write a DELETE statement that deletes Adams (the second instructor you added in
--exercise 2). To identify the row, use the InstructorID column.
DELETE Instructors
	WHERE LastName='Adams'
--#5 Write a DELETE statement that deletes the row in the Departments table that has an
--ID of 9. Then, run the statement. It will produce an error since the department has
--related rows in the Instructors table. To fix that, precede the DELETE statement with
--another DELETE statement that deletes all instructors in this department from the Instructors table.
DELETE Instructors
	WHERE DepartmentID=9
DELETE Departments
	WHERE DepartmentID=9
SELECT *
	FROM Departments
--#6Write an UPDATE statement that increases the annual salary for all instructors in the
--Education department by 5%. (Hint: join the Departments and Instructors tables and
--then filter the rows by the department name.)
UPDATE Instructors
	SET AnnualSalary= AnnualSalary*1.05
	FROM Instructors I
	JOIN Departments D ON D.DepartmentID=I.DepartmentID
	WHERE DepartmentName='English'
