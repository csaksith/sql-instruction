--1.28.2025 pg 188-189
--#1 Write a SELECT statement that returns the same result set as this SELECT statement. 
--Substitute a subquery in a WHERE clause for the inner join.
SELECT DISTINCT VendorName
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID=I.VendorID
	ORDER BY VendorName

SELECT VendorName
	FROM Vendors
	WHERE VendorID IN
	(SELECT VendorID
		FROM Invoices)
	ORDER BY VendorName

--#2 Write a SELECT statement that answers this question: 
--Which invoices have a PaymentTotal that’s greater than the average PaymentTotal for all paid invoices? 
--Return the InvoiceNumber and InvoiceTotal for each invoice
SELECT *
	FROM Invoices
SELECT InvoiceNumber,InvoiceTotal
	FROM Invoices
	WHERE PaymentTotal>
		(SELECT AVG(PaymentTotal) FROM Invoices
		WHERE PaymentTotal <> 0)

--#3 Write a SELECT statement that answers this question: 
--Which invoices have a PaymentTotal that’s greater than the median PaymentTotal for all paid invoices?
--The median marks the midpoint in a set of values. --In other words, an equal number of values lie above and below the median value.) --Return the InvoiceNumber and InvoiceTotal for each invoice.--Hint: Begin with the solution to exercise 2, then use the ALL keyword in the WHERE clause and 
--code “TOP 50 PERCENT PaymentTotal” in the subquery.
SELECT InvoiceNumber, InvoiceTotal
	FROM Invoices
	WHERE PaymentTotal> ALL
	(SELECT TOP 50 PERCENT PaymentTotal 
	FROM Invoices
	WHERE PaymentTotal <>0
	ORDER BY PaymentTotal)

--#4 Write a SELECT statement that returns two columns from the GLAccounts table: 
--AccountNo and AccountDescription. 
--The result set should have one row for each account number that has never been used. 
--Use a correlated subquery introduced with the NOT EXISTS operator. 
--Sort the final result set by AccountNo.

SELECT AccountNo, AccountDescription
	FROM GLAccounts G1
	WHERE NOT EXISTS
		(SELECT *
		 FROM InvoiceLineItems LI
		 WHERE G1.AccountNo=LI.AccountNo)
	ORDER BY AccountNo

SELECT *
	FROM InvoiceLineItems

--#5 Write a SELECT statement that returns four columns: --VendorName, InvoiceID, InvoiceSequence, and InvoiceLineItemAmount --for each invoice that has more than one line item in the InvoiceLineItems table.--Hint: Use a subquery that tests for InvoiceSequence > 1.
SELECT VendorName, I.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
	FROM Vendors V
	JOIN Invoices I ON I.VendorID=V.VendorID
	JOIN InvoiceLineItems LI ON LI.InvoiceID=I.InvoiceID
	WHERE I.InvoiceID IN
		(SELECT InvoiceID
			FROM InvoiceLineItems
			WHERE InvoiceSequence>1)
	ORDER BY VendorName, I.InvoiceID, InvoiceSequence
--subquery
SELECT InvoiceID
	FROM InvoiceLineItems
	WHERE InvoiceSequence>1
SELECT *
	FROM Vendors
SELECT *
	FROM InvoiceLineItems


--#6 Write a SELECT statement that returns a single value that --represents the sum of the largest unpaid invoices submitted by each vendor. --Use a derived table that returns MAX(InvoiceTotal) grouped by --VendorID, filtering for invoices with a balance due.SELECT SUM(InvoiceMAX) AS 'Sum of InvoiceMax'	FROM (SELECT MAX(InvoiceTotal) AS InvoiceMAX			FROM Invoices			WHERE (InvoiceTotal-PaymentTotal-CreditTotal)>0			GROUP BY VendorID) AS MaxInvoiceSELECT *
	FROM Vendors
SELECT *
	FROM InvoiceLineItemsSELECT *	FROM Invoices--#7 Write a SELECT statement that returns the name, city, and state of each vendor --that’s located in a unique city and state. --In other words, don’t include vendors that have a city and state in common with another vendor.
SELECT VendorName, VendorCity, VendorState 
	FROM Vendors V1
	WHERE VendorCity + VendorState NOT IN
		(SELECT VendorCity + VendorState
		FROM Vendors V2
		WHERE V2.VendorID<>V1.VendorID )
	ORDER BY VendorCity, VendorState

--#8  Write a SELECT statement that returns four columns: 
--VendorName, InvoiceNumber, InvoiceDate, and InvoiceTotal. 
--Return one row per vendor,
--representing the vendor’s invoice with the earliest date.
SELECT VendorName, InvoiceNumber,InvoiceDate,InvoiceTotal
	FROM Invoices I
	JOIN Vendors V ON I.VendorID=V.VendorID
	WHERE InvoiceDate =
	(SELECT MIN(InvoiceDate)
		FROM Invoices I2
		WHERE I2.VendorID=I.VendorID)
		ORDER BY VendorName



SELECT *
	FROM Invoices
SELECT *
	FROM Vendors
SELECT *
	FROM InvoiceLineItems
--#9 Rewrite exercise 6 so it uses a common table expression (CTE) instead of a derived table.
SELECT SUM(InvoiceMAX) AS 'Sum of InvoiceMax'	FROM (SELECT MAX(InvoiceTotal) AS InvoiceMAX			FROM Invoices			WHERE (InvoiceTotal-PaymentTotal-CreditTotal)>0			GROUP BY VendorID) AS MaxInvoice

--CTE 

WITH Summary AS
	(SELECT MAX(InvoiceTotal) AS InvoiceMAX			FROM Invoices			WHERE (InvoiceTotal-PaymentTotal-CreditTotal)>0			GROUP BY VendorID)SELECT SUM(InvoiceMAX) AS 'Sum of InvoiceMax'	FROM Summary