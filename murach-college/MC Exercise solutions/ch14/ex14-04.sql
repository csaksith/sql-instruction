USE MurachCollege;

BEGIN TRY
	DELETE Departments 
	WHERE DepartmentName = 'Sociology';

	PRINT 'SUCCESS: Record was deleted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not deleted.';

	PRINT 'Error ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;