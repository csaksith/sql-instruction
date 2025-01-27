USE MyGuitarShop;

DROP FUNCTION IF EXISTS fnDiscountPrice;
GO

CREATE FUNCTION fnDiscountPrice
(
   @ItemID INT
)
RETURNS MONEY
BEGIN
  DECLARE @DiscountPrice MONEY;
  
  SELECT @DiscountPrice = ItemPrice - DiscountAmount
  FROM OrderItems
  WHERE ItemID = @ItemID;
  
  RETURN @DiscountPrice;  
END;
GO

SELECT ItemID, ItemPrice, DiscountAmount, 
       dbo.fnDiscountPrice(ItemID) AS DiscountPrice
FROM OrderItems;