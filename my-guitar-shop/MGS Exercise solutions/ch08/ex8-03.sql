SELECT OrderDate, 
    CONVERT(varchar, OrderDate, 1) AS OrderDateConverted,
	CONVERT(varchar, OrderDate, 100) AS AMPM, 
    CONVERT(varchar, OrderDate, 14) AS OrderTime             
FROM Orders;