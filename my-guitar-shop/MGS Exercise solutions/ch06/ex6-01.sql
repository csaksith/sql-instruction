SELECT CategoryName
FROM Categories
WHERE CategoryID IN
     (SELECT DISTINCT CategoryID FROM Products)
ORDER BY CategoryName;