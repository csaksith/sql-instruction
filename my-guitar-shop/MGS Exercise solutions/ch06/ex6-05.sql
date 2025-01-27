SELECT ProductName, DiscountPercent
FROM Products
WHERE DiscountPercent NOT IN (
    SELECT DiscountPercent
    FROM Products
    GROUP BY DiscountPercent
    HAVING count(DiscountPercent) > 1)
ORDER BY ProductName;