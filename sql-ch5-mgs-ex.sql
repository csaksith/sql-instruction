--1.27.2025 my guitar shop ch 5 exercises
--#1 Write a SELECT statement that returns these columns:
--The count of the number of orders in the Orders table
--The sum of the TaxAmount column in the Orders table
SELECT *
	FROM Orders;
SELECT COUNT(OrderID) AS NumberOfOrders, SUM(TaxAmount) AS TotalTaxAmount
	FROM Orders;

--#2 Write a SELECT statement that returns one row for each category that has products.
--The statement should return these columns:
--The CategoryName column from the Categories table
--The number of products in each category
--The list price of the most expensive product in each category
--Sort the result set so the category with the most products appears first.
SELECT *
	FROM Products
SELECT *
	FROM Categories
SELECT C.CategoryName, COUNT(P.ProductID) AS 'Number of Products', 
	   MAX(ListPrice) AS MaxListPrice
	FROM Products P
	JOIN Categories C
	ON C.CategoryID=P.CategoryID
	GROUP BY CategoryName
	ORDER BY 'Number of Products' DESC
--from solutions
SELECT CategoryName, COUNT(*) AS ProductCount,
       MAX(ListPrice) AS MostExpensiveProduct
FROM Categories c 
  JOIN Products p
    ON c.CategoryID = p.CategoryID
GROUP BY CategoryName
ORDER BY ProductCount DESC;
--#3 Write a SELECT statement that returns one row for each customer that has orders.
--The statement should return these columns:
--The EmailAddress column from the Customers table
--The total price of the items the customer has ordered 
--(Hint: multiply the item price in the OrderItems table by the quantity in the OrderItems table)
--The total discount applied to the items the customer has ordered 
--(Hint: multiply the discount amount column in the OrderItems table by the quantity in the OrderItems table)
--Sort the result set in descending sequence by the price total for each customer.

SELECT *
	FROM Customers
SELECT *
	FROM Categories
SELECT *
	FROM Products
SELECT *
	FROM Categories
SELECT *
	FROM Customers
SELECT *
	FROM OrderItems
SELECT *
	FROM Orders
SELECT C.EmailAddress, (Quantity*ItemPrice) AS TotalPrice
	FROM Customers C
	JOIN Orders O
	ON O.CustomerID=C.CustomerID
	JOIN OrderItems OI
	ON OI.OrderID=O.OrderID