USE MyGuitarShop;

DROP TRIGGER IF EXISTS Products_INSERT;
GO

CREATE TRIGGER Products_INSERT
  ON Products
  AFTER INSERT 
AS
IF (SELECT DateAdded FROM inserted) IS NULL
  UPDATE Products
  SET DateAdded = GETDATE()
  WHERE ProductID = (SELECT ProductID FROM inserted);

GO

-- Test
INSERT INTO products 
  (CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent)
VALUES
  (1, 'G5122b', 'Gretsch G5122b Double Cutaway Hollowbody', '', 999.99, 32);

-- Check
-- SELECT ProductID, ProductName, DateAdded FROM Products;

-- Clean up
-- DELETE FROM Products WHERE ProductID > 10;
-- GO