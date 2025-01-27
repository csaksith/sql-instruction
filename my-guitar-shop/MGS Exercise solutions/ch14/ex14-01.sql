USE MyGuitarShop;

DECLARE @ProductCount INT;

SELECT @ProductCount = COUNT(*)
FROM Products;
  
IF @ProductCount >= 7
  PRINT 'The number of products is greater than or equal to 7';
ELSE
  PRINT 'The number of products is less than 7';