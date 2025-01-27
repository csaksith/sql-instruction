SELECT OrderID, OrderDate, DATEADD(day, 2, OrderDate) AS ApproxShipDate,
       ShipDate,
       DATEDIFF(day, OrderDate, ShipDate) AS DaysToShip
FROM Orders

WHERE OrderDate > '2023-01-01' AND OrderDate < '2023-02-01'