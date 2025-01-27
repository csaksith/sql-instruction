SELECT ProductName, 
  SUM((ItemPrice - DiscountAmount) * Quantity) AS ProductTotal
FROM Products p
  JOIN OrderItems oi 
    ON p.ProductID = oi.ProductID
GROUP BY ROLLUP(ProductName);
-- GROUP BY ProductName WITH ROLLUP -- before SQL Server 2008