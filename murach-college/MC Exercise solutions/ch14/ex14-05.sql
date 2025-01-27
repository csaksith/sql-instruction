USE MurachCollege;

DECLARE @CourseIDVar INT;
DECLARE @Enrollment    INT;
DECLARE @MinEnrollment INT;
DECLARE @MaxEnrollment INT;

SET @MinEnrollment = 5;
SET @MaxEnrollment = 10;

DECLARE Enrollment_Cursor CURSOR
FOR
	SELECT CourseID, Count(*) AS Enrollment
	FROM StudentCourses
	GROUP BY CourseID;

OPEN Enrollment_Cursor;

FETCH NEXT FROM Enrollment_Cursor INTO @CourseIDVar, @Enrollment;
WHILE @@FETCH_STATUS <> -1
	BEGIN
		IF @Enrollment < @MinEnrollment
			PRINT 'Too few students enrolled in course ' + CAST(@CourseIDVar AS VARCHAR);
		ELSE
			IF @Enrollment > @MaxEnrollment
				PRINT 'Too many students enrolled in course ' + CAST(@CourseIDVar AS VARCHAR);
		FETCH NEXT FROM Enrollment_Cursor INTO @CourseIDVar, @Enrollment;
	END;

CLOSE Enrollment_Cursor;
DEALLOCATE Enrollment_Cursor;