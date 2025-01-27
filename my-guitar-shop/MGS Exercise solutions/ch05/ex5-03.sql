SELECT EmailAddress, SUM(ItemPrice * Quantity) AS PriceTotal, 
  SUM(DiscountAmount * Quantity) AS DiscountAmountTotal
FROM Customers c
  JOIN Orders o 
    ON c.CustomerID = o.CustomerID
  JOIN OrderItems oi 
    ON o.OrderID = oi.OrderID
GROUP BY EmailAddress
ORDER BY PriceTotal DESC;