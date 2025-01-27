USE MyGuitarShop;

DROP PROC IF EXISTS spInsertProduct;
GO

CREATE PROC spInsertProduct
  @CategoryID         INT,
  @ProductCode        VARCHAR(10),
  @ProductName        VARCHAR(255),
  @ListPrice          MONEY,
  @DiscountPercent    MONEY
AS
  -- validate parameters
IF @ListPrice < 0
  THROW 50001, 'The list price must be a positive number.', 1;
IF @DiscountPercent < 0
  THROW 50001, 'The discount percent must be a positive number.', 1;  

INSERT INTO Products
  (CategoryID, ProductCode, ProductName, Description, 
   ListPrice, DiscountPercent, DateAdded)
VALUES
  (@CategoryID, @ProductCode, @ProductName, '', 
   @ListPrice, @DiscountPercent, GETDATE());

GO

-- Test fail: 
EXEC spInsertProduct 1, 'G5122', 'Gretsch G5122 Double Cutaway Hollowbody', 999.99, -32;
GO

-- Test success: 
EXEC spInsertProduct 1, 'G5122', 'Gretsch G5122 Double Cutaway Hollowbody', 999.99, 32;
GO

-- Clean up: 
-- DELETE FROM products WHERE ProductID > 10;
-- GO

-- Check: 
-- SELECT ProductName, ListPrice FROM Products;