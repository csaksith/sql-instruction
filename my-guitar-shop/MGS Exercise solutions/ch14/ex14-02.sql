USE MyGuitarShop;

DECLARE @ProductCount   INT;
DECLARE @ListPriceAvg   MONEY;

SELECT @ProductCount = COUNT(*), @ListPriceAvg = AVG(ListPrice)
FROM Products;

IF @ProductCount >= 7
  BEGIN
    PRINT 'Product count: ' + CONVERT(VARCHAR, @ProductCount, 1);
    PRINT 'List price average: ' + CONVERT(VARCHAR, @ListPriceAvg, 1);
  END;
ELSE
  BEGIN
    PRINT 'The number of products is less than 7.';
  END;