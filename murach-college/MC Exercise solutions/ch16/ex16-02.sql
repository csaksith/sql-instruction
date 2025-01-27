USE MurachCollege;

DECLARE @StudentID int;
DECLARE @CourseID int;
SET @CourseID = 12;

BEGIN TRY
  BEGIN TRAN;

  INSERT Students 
  VALUES ('Smith', 'John', GETDATE(), NULL);

  SET @StudentID = @@IDENTITY;

  INSERT StudentCourses 
  VALUES (@StudentID, @CourseID);

  COMMIT TRAN;
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
END CATCH;