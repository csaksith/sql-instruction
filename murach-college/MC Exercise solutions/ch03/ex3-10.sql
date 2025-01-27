SELECT FullTimeCost, PerUnitCost,
	   12 AS Units,
	   PerUnitCost * 12 AS TotalPerUnitCost,
	   FullTimeCost + (PerUnitCost * 12) AS TotalTuition
FROM Tuition;