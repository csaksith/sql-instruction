USE MurachCollege;

DECLARE @StudentID int;
SET @StudentID = 10;

BEGIN TRY
  BEGIN TRAN;

  DELETE StudentCourses
  WHERE StudentID = @StudentID;

  DELETE Students
  WHERE StudentID = @StudentID;

  COMMIT TRAN;
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
END CATCH;