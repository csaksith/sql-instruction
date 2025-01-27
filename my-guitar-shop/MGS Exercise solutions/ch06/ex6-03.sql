SELECT CategoryName
FROM Categories c
WHERE NOT EXISTS
    (SELECT *
     FROM Products
     WHERE CategoryID = c.CategoryID);
