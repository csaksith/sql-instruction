USE MyGuitarShop;

DROP TRIGGER IF EXISTS Products_UPDATE;
GO

CREATE TRIGGER Products_UPDATE
  ON Products
  AFTER UPDATE 
AS

IF (SELECT DiscountPercent FROM inserted) >= 100
  THROW 50001, 'The discount percent must be less than 100.', 1;

IF (SELECT DiscountPercent FROM inserted) < 0
  THROW 50001, 'The discount percent must be a positive number.', 1;

IF (SELECT DiscountPercent FROM inserted) >=0 AND 
   (SELECT DiscountPercent FROM inserted) < 1
      UPDATE Products
      SET DiscountPercent = (SELECT DiscountPercent FROM inserted) * 100
      WHERE ProductID = (SELECT ProductID FROM inserted);

GO

-- fire trigger
UPDATE Products
SET DiscountPercent = .25
WHERE ProductID = 1;
GO

-- check results
-- SELECT ProductID, ProductCode, ProductName, DiscountPercent FROM Products;
-- GO