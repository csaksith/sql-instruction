-- 1.27.2025
-- my guitar shop ch4 exercise
--#3 Write a SELECT statement that joins the Customers, Orders, OrderItems,
--Products tables. This statement should return these columns: LastName, FirstName,
--OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity

SELECT *
	FROM Customers;

SELECT *
	FROM Addresses;
	
SELECT FirstName, LastName, Line1 AS Address,City, State, ZipCode
	FROM Customers C
	JOIN Addresses A ON C.ShippingAddressID=A.AddressID
	AND C.CustomerID=A.CustomerID;
	--customerID has to meet shipping address,


--#5 Write a SELECT statement that returns the ProductName and ListPrice columns from the Products table.
--Return one row for each product that has the same list price as another product.
--(Hint: Use a self-join to check that the ProductID columns aren’t equal but the ListPrice column is equal.)
--Sort the result set by ProductName

SELECT P1.ProductName, P2.ProductName,P1.ListPrice
	FROM Products P1
	JOIN Products P2 ON P1.ListPrice=P2.ListPrice
	WHERE P1.ProductID<>P2.ProductID
	ORDER BY ListPrice;


