CREATE VIEW ProductSummary
AS
SELECT ProductName, COUNT(ProductName) AS OrderCount, 
    SUM(ItemTotal) AS OrderTotal
FROM OrderItemProducts
GROUP BY ProductName