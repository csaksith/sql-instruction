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


