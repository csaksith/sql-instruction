USE MyGuitarShop;

-- After you create the products Audit table, you can comment out the code that creates it
DROP TABLE IF EXISTS ProductsAudit;
GO

CREATE TABLE ProductsAudit (
  AuditID           INT            PRIMARY KEY IDENTITY,
  ProductID         INT            NOT NULL,
  CategoryID        INT            NOT NULL,
  ProductCode       VARCHAR(10)    NOT NULL,
  ProductName       VARCHAR(255)   NOT NULL,
  ListPrice         MONEY          NOT NULL,
  DiscountPercent   MONEY          NOT NULL      DEFAULT 0.00,
  DateUpdated       DATETIME                     DEFAULT NULL
);
GO

DROP TRIGGER IF EXISTS Products_UPDATE_AUDIT;
GO

CREATE TRIGGER Products_UPDATE_AUDIT
  ON Products
  AFTER UPDATE
AS
  INSERT INTO ProductsAudit 
    (ProductID, CategoryID, 
     ProductCode, ProductName, ListPrice, DiscountPercent, DateUpdated)
  VALUES(
    (SELECT ProductID FROM deleted), 
    (SELECT CategoryID FROM deleted), 
    (SELECT ProductCode FROM deleted), 
    (SELECT ProductName FROM deleted), 
    (SELECT ListPrice FROM deleted), 
    (SELECT DiscountPercent FROM deleted), 
     GETDATE());

GO

-- test
UPDATE Products
SET ListPrice = 749.00
WHERE ProductID = 1;

-- check
-- SELECT * FROM ProductsAudit;

-- clean up
-- UPDATE Products
-- SET ListPrice = 699.00
-- WHERE ProductID = 1;