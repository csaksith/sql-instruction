USE MyGuitarShop;

BEGIN TRY
	INSERT Categories (CategoryName) 
	VALUES ('Guitars');

	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.';

	PRINT 'Error ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;