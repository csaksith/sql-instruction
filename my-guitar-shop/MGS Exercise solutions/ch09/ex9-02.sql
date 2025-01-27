SELECT OrderDate,  
    YEAR(OrderDate) AS OrderYear,
	DAY(OrderDate) AS DayOnly,
	DATEADD(DAY, 30, OrderDate) AS DueDate
FROM Orders