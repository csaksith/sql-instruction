SELECT EmailAddress, OrderID, OrderDate
FROM Customers c
  JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE OrderDate =
  (SELECT MIN(OrderDate)
   FROM Orders
   WHERE CustomerID = o.CustomerID)
GROUP BY EmailAddress, OrderID, OrderDate;
