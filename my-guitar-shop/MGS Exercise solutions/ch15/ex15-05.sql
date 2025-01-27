USE MyGuitarShop;

DROP PROC IF EXISTS spUpdateProductDiscount;
GO

CREATE PROC spUpdateProductDiscount
  @ProductID         INT,
  @DiscountPercent   MONEY
AS
-- validate parameters
IF @DiscountPercent < 0
  THROW 50001, 'The discount percent must be a positive number.', 1;  

UPDATE Products
SET DiscountPercent = @DiscountPercent
WHERE ProductID = @ProductID;

GO

-- Test fail: 
EXEC spUpdateProductDiscount 1, -30;
GO

-- Test success: 
EXEC spUpdateProductDiscount 1, 30;
GO

-- Check
-- SELECT ProductID, ProductName, DiscountPercent FROM Products;

-- Clean up: 
/*
UPDATE Products 
SET DiscountPercent = 30.00
WHERE ProductID = 1;
*/