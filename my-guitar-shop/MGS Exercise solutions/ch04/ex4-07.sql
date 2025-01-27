  SELECT 'SHIPPED' AS ShipStatus, OrderId, OrderDate
  FROM Orders
  WHERE ShipDate IS NOT NULL
UNION
  SELECT 'NOT SHIPPED', OrderID, OrderDate
  FROM Orders
  WHERE ShipDate IS NULL
ORDER BY OrderDate;