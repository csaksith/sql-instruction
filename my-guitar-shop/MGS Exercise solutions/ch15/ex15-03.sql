USE MyGuitarShop;

DROP FUNCTION IF EXISTS fnItemTotal;
GO

CREATE FUNCTION fnItemTotal 
  (@ItemID INT)
  RETURNS MONEY
BEGIN
  DECLARE @ItemTotal MONEY;
  
  SELECT @ItemTotal = dbo.fnDiscountPrice(ItemID) * Quantity
  FROM OrderItems
  WHERE ItemID = @ItemID;
  
  RETURN @ItemTotal;  
END;
GO

SELECT ItemID, ItemPrice, DiscountAmount, 
       dbo.fnDiscountPrice(ItemID) AS DiscountPrice, 
	   Quantity, dbo.fnItemTotal(ItemID) AS ItemTotal
FROM OrderItems;