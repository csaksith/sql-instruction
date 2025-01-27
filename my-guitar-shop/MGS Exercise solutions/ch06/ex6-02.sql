SELECT ProductName, ListPrice
FROM Products p
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Products)
ORDER BY ListPrice DESC;