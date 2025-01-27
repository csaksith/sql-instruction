USE MyGuitarShop;

DECLARE @CustomerID int;
SET @CustomerID = 8;

BEGIN TRY
  BEGIN TRAN;

  DELETE Addresses
  WHERE CustomerID = @CustomerID;

  DELETE Customers
  WHERE CustomerID = @CustomerID;

  COMMIT TRAN;
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
END CATCH;