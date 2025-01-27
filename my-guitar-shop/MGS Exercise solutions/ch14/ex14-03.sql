USE MyGuitarShop;

DECLARE @X INT;
DECLARE @Y INT;
DECLARE @I INT;

SET @X = 10;
SET @Y = 20;
SET @I= 1;

PRINT('Common factors of ' + CONVERT(VARCHAR, @X, 1) 
    + ' and ' + CONVERT(VARCHAR, @Y, 1));

WHILE (@I < @X)
  BEGIN
	IF (@Y % @I = 0 AND @X % @I = 0)
		PRINT(CONVERT(VARCHAR, @I, 1));        
	SET @I = @I + 1;
  END;