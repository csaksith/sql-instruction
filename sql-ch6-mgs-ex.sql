--1.28.2025 ch6 mgs exercises
--#1 Write a SELECT statement that returns the same result set as this SELECT
--statement, but don’t use a join. Instead, use a subquery in a WHERE clause that uses the IN operator
SELECT DISTINCT CategoryName
	FROM Categories C
	JOIN Products P ON C.CategoryID=P.CategoryID
	ORDER BY CategoryName

SELECT CategoryName
	FROM Categories C
	WHERE CategoryID IN
	(SELECT DISTINCT CategoryID
		FROM Products P)
	ORDER BY CategoryName

--#2 Write a SELECT statement that answers this question: Which products have a list
--price that’s greater than the average list price for all products?
--Return the ProductName and ListPrice columns for each product.
--Sort the results by the ListPrice column in descending sequence
SELECT ProductName, ListPrice
	FROM Products
	WHERE ListPrice>
		(SELECT AVG(ListPrice)
			FROM Products)
	ORDER BY ListPrice DESC
SELECT *
	FROM Products

--#3 Write a SELECT statement that returns the CategoryName column from the Categories table.
--Return one row for each category that has never been assigned to any product in the
--Products table. To do that, use a subquery introduced with NOT EXISTS
SELECT CategoryName 
	FROM Categories C
	WHERE NOT EXISTS
		(SELECT *
			FROM Products P
			WHERE P.CategoryID=C.CategoryID)
	
SELECT *
	FROM Categories
SELECT *
	FROM Products

--#4 Write a SELECT statement that returns three columns: EmailAddress, OrderID, and
--the order total for each order. To do this, you can group the result set by the
--EmailAddress and OrderID columns. Then, you can calculate the order total from the
--columns in the OrderItems table.
--Write a second SELECT statement that uses the first SELECT statement in its FROM
---clause. The main query should return two columns: the customer’s email address and
--the largest order for that customer. To do this, you can group the result set by the
--EmailAddress column
SELECT TOP 5 *
	FROM Customers
SELECT TOP 5 *
	FROM Orders
SELECT TOP 5 *
	FROM OrderItems

SELECT EmailAddress, O.OrderID, (OI.Quantity*OI.ItemPrice) AS OrderTotal
	FROM Customers C
	JOIN Orders O ON O.CustomerID=C.CustomerID
	JOIN OrderItems OI ON OI.OrderID=O.OrderID


SELECT EmailAddress, MAX(OrderTotal) AS LargestOrder
	FROM Customers
		WHERE EmailAddress IN
		(SELECT EmailAddress, O.OrderID, (OI.Quantity*OI.ItemPrice) AS OrderTotal
			FROM Customers C
			JOIN Orders O ON O.CustomerID=C.CustomerID
			JOIN OrderItems OI ON OI.OrderID=O.OrderID)
	GROUP BY EmailAddress



