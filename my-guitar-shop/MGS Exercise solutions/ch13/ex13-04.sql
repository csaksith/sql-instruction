CREATE VIEW OrderItemProducts
AS
SELECT o.OrderID, OrderDate, TaxAmount, ShipDate, 
       ProductName, ItemPrice, DiscountAmount, ItemPrice - DiscountAmount AS FinalPrice, Quantity, 
       (ItemPrice - DiscountAmount) * Quantity AS ItemTotal       
FROM Orders o
    JOIN OrderItems li 
      ON o.OrderID = li.OrderID
    JOIN Products p 
      ON li.ProductID = p.ProductID