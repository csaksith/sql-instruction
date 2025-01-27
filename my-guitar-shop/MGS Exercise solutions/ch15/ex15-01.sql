USE MyGuitarShop;

DROP PROC IF EXISTS spInsertCategory;
GO

CREATE PROC spInsertCategory
  @CategoryName VARCHAR(255)
AS
  INSERT INTO Categories (CategoryName)
  VALUES (@CategoryName);

GO

-- Test fail: 
EXEC spInsertCategory 'Guitars';
GO

-- Test success: 
EXEC spInsertCategory 'New Category';
GO

-- Clean up: 
-- DELETE FROM Categories WHERE CategoryID > 3;
-- GO