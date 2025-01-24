SELECT *
	FROM Categories;
SELECT *
	FROM Products;

--#4 Display ProductName, ListPrice, DiscountPercent,
--	 DiscountAmount (calc), DiscountPrice(calc)
--	 SORT: DiscountPrice(desc)
SELECT ProductName, ListPrice, DiscountPercent,
	(ListPrice * (DiscountPercent/100)) AS DiscountAmount, 
	ListPrice - (ListPrice*(DiscountPercent/100)) AS DiscountPrice
	FROM Products
	ORDER BY DiscountPrice DESC;