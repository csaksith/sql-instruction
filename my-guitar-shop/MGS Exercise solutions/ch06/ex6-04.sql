SELECT EmailAddress, MAX(OrderTotal) AS MaxOrderTotal
FROM
(
  SELECT EmailAddress, o.OrderID, 
    SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
  FROM Customers c
    JOIN Orders o 
      ON c.CustomerID = o.CustomerID
    JOIN OrderItems oi 
      ON o.OrderID = oi.OrderID
  GROUP BY EmailAddress, o.OrderID
) t
GROUP BY EmailAddress;