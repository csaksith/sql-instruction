--1.27.2025
--ch5 pg 137 # of invoices, sum total due where total due > 0
SELECT *
	FROM Invoices;

SELECT InvoiceNumber, (InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices;

SELECT COUNT(*)
	FROM Invoices;
	-- how many invoices have a balance due?
SELECT COUNT(*) AS NumberOfInvoices, SUM(InvoiceTotal-PaymentTotal-CreditTotal)  AS TotalDue
	FROM Invoices
	WHERE InvoiceTotal-PaymentTotal-CreditTotal>0;

-- how many total invoices, avg inv total, total inv amount? for invoices after 7/1/22?
SELECT 'After 7/1/2022' AS SelectionDate,
		COUNT(*) AS NumberOfInvoices,
		AVG(InvoiceTotal) AS AvgInvoiceAmount,
		SUM(InvoiceTotal) AS TotalInvoiceAmount
		FROM Invoices
		WHERE InvoiceDate >'2022-07-01';

--min/max example pg 139
SELECT 'After 7/1/2022' AS SelectionDate,
		COUNT(*) AS NumberOfInvoices,
		MAX(InvoiceTotal) AS HighInvoiceTotal,
		MIN(InvoiceTotal) AS LowestInvoiceTotal
		FROM Invoices
		WHERE InvoiceDate >'2022-07-01';

--pg 139 first or last vendor abc order
SELECT MIN(VendorName) AS FirstVendor,
	   MAX(VendorName) AS LastVendor,
	   COUNT(VendorName) AS NumberOfVendors
	   FROM Vendors

--pg 139 DISTINCT in summary queries
SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors,
	   COUNT(*) AS NumberOfInvoices,
	   AVG(InvoiceTotal) AS AverageInvoiceAmount,
	   SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices;

	--there are multiple of the same VendorID

--pg 141 GROUP BY and HAVING clauses
--average inv amount by vendor - avg over $2000?
SELECT VendorID, AVG(InvoiceTotal) as AvgInvoiceAmt
	FROM Invoices
	GROUP BY VendorID
	HAVING AVG(InvoiceTotal)>2000
	ORDER BY AvgInvoiceAmt DESC;

--pg 143 # of invoices by vendor
SELECT VendorID, COUNT(*) AS InvoiceQty
	FROM Invoices	
	GROUP BY VendorID;

--pg 143 vendors by state and city, inv qty and inv avg
SELECT VendorState,VendorCity,COUNT(*) AS InvoiceQTY, AVG(InvoiceTotal) AS InvoiceAverage
	FROM Invoices I
	JOIN Vendors V ON I.VendorID=V.VendorID
	GROUP BY VendorState, VendorCity
	ORDER BY VendorState,VendorCity

--limit the results using having clause
	--counting city and states that have at least 2 invoices
SELECT VendorState,VendorCity,COUNT(*) AS InvoiceQTY, AVG(InvoiceTotal) AS InvoiceAverage
	FROM Invoices I
	JOIN Vendors V ON I.VendorID=V.VendorID
	GROUP BY VendorState, VendorCity
	HAVING COUNT(*)>=2

--pg 145 search condition in HAVING clause
	SELECT VendorName, COUNT(*) AS InvoiceQty,
		   AVG(InvoiceTotal) AS InvoiceAvg
		   FROM Vendors V
		   JOIN Invoices I ON V.VendorID=I.VendorID
		   GROUP BY VendorName
		   HAVING AVG(InvoiceTotal)>500
			-- cannot do the alias 'InvoiceAvg' 
		   ORDER BY InvoiceQty DESC
-- pg 145 search conditon using WHERE clause
	SELECT VendorName, COUNT(*) AS InvoiceQty,
		   AVG(InvoiceTotal) AS InvoiceAvg
		   FROM Vendors V
		   JOIN Invoices I ON V.VendorID=I.VendorID
		   WHERE InvoiceTotal>500
		   GROUP BY VendorName
		   ORDER BY InvoiceQty DESC
--pg 149 invoices by vendor, grouped, to get inv count, and inv total with summary row
--using ROLLUP clause
SELECT VendorID, COUNT(*) AS InvoiceCOUNT, SUM(InvoiceTotal) AS InvoiceSUM
	FROM Invoices
	GROUP BY ROLLUP(VendorID);
-- summary row at bottom

--rollup multiple columns: vendors from IA and NJ, rollup by vendorstate and city
SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
	WHERE VendorState IN ('IA','NJ')
	GROUP BY ROLLUP(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC

--pg 151 
SELECT VendorID, COUNT(*) AS InvoiceCount,
	   SUM(InvoiceTotal) AS InvoiceSUM
	   FROM Invoices
	   GROUP BY CUBE(VendorID);

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
	WHERE VendorState IN ('IA','NJ')
	GROUP BY CUBE(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC
--you can see how CUBE differs from ROLLUP when you group by two or more columns. 
--In this case, the result set includes a summary row for each state just as it did with the ROLLUP operator. 
--In addition, it includes a summary row for each city.

--pg 153 grouping sets
SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY GROUPING SETS(VendorState, VendorCity)
	ORDER BY VendorState DESC, VendorCity DESC
--composite grouping
SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
	WHERE VendorState IN ('IA', 'NJ')
	GROUP BY GROUPING SETS((VendorState, VendorCity), VendorZipCode, ())
	ORDER BY VendorState DESC, VendorCity DESC


--pg 155 OVER clause
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	   SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	   COUNT(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	   AVG(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
	   FROM Invoices
	   -- date summaries

--pg 156 ch5 exercises 
--#1 Write a SELECT statement that returns two columns from the Invoices table: 
--VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. 
--Group the result set by VendorID.
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices
	GROUP BY VendorID;
SELECT *
	FROM Invoices;

SELECT *
	FROM Vendors;
--#2  Write a SELECT statement that returns two columns: 
--VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. 
--Group the result set by VendorName. 
-- Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most. 
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
	FROM Vendors V
	JOIN Invoices I ON I.VendorID = V.VendorID
	GROUP BY VendorName
	ORDER BY PaymentSum DESC

SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
FROM Vendors v 
  JOIN Invoices i
    ON v.VendorID = i.VendorID
GROUP BY VendorName
ORDER BY PaymentSum DESC;

--#3  Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. 
--InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. 
--Group the result set by vendor. 
--Sort the result set so the vendor with the highest number of invoices appears first.
SELECT VendorName, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
	FROM Vendors V
	JOIN Invoices I
    ON V.VendorID = I.VendorID
	GROUP BY VendorName
	ORDER BY InvoiceCount DESC

--#4 Write a SELECT statement that returns three columns: 
--AccountDescription, LineItemCount, and LineItemSum. 
--LineItemCount is the number of entries in the InvoiceLineItems table that have that AccountNo. 
--LineItemSum is the sum of the InvoiceLineItemAmount column for that AccountNo. 
--Filter the result set to include only those rows with LineItemCount greater than 1. 
--Group the result set by account description 
--sort it by descending LineItemCount. 
--Hint: Join the GLAccounts table to the InvoiceLineItems table.

SELECT *
	FROM InvoiceLineItems
SELECT *
	FROM GLAccounts;

SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts G
	JOIN InvoiceLineItems I ON I.AccountNo=G.AccountNo
	GROUP BY AccountDescription
	HAVING COUNT(*)>1
	ORDER BY LineItemCount DESC

SELECT gl.AccountDescription, COUNT(*) AS LineItemCount,
SUM(InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts gl
  JOIN InvoiceLineItems li
    ON gl.AccountNo = li.AccountNo
GROUP BY gl.AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC;

--#5 Modify the solution to exercise 4 to filter for invoices dated from October 1, 2022 to December 31, 2022.
--Hint: Join the Invoices table so you can code a search condition based on InvoiceDate.
SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts G
	JOIN InvoiceLineItems IL ON IL.AccountNo=G.AccountNo
	JOIN Invoices I ON I.InvoiceID=IL.InvoiceID
	WHERE InvoiceDate BETWEEN '2022-10-01' AND '2022-12-31'
	GROUP BY G.AccountDescription
	HAVING COUNT(*)>1
	ORDER BY LineItemCount DESC
	
SELECT gl.AccountDescription, COUNT(*) AS LineItemCount,
      SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts gl
  JOIN InvoiceLineItems li
    ON gl.AccountNo = li.AccountNo
  JOIN Invoices i
    ON li.InvoiceID = i.InvoiceID
	WHERE InvoiceDate BETWEEN '2022-10-01' AND '2022-12-31'
	GROUP BY gl.AccountDescription
	HAVING COUNT(*) > 1
	ORDER BY LineItemCount DESC;
--#6Write a SELECT statement that answers the following question:
--What is the total amount invoiced for each AccountNo? 
--Use the ROLLUP operator to include a row that gives the grand total. 
--Hint: Use the InvoiceLineItemAmount column of the InvoiceLineItems table.
SELECT AccountNo, SUM(InvoiceLineItemAmount) AS 'Total Invoice'
	FROM InvoiceLineItems
	GROUP BY ROLLUP(AccountNo)

SELECT AccountNo, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems
GROUP BY AccountNo WITH ROLLUP;

SELECT *
	FROM Invoices
SELECT *
	FROM InvoiceLineItems
SELECT *
	FROM GLAccounts;
SELECT *
	FROM Vendors;

--#7 Write a SELECT statement that returns four columns: 
--VendorName, Account-Description, LineItemCount, and LineItemSum. 
--LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column.
--For each vendor and account, return the number and sum of line items, 
--sorted first by vendor, then by account description.
-- 4 table join

SELECT VendorName, AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM Vendors V
	JOIN Invoices I ON I.VendorID=V.VendorID
	JOIN InvoiceLineItems LI ON LI.InvoiceID=I.InvoiceID
	JOIN GLAccounts G ON G.AccountNo=V.DefaultAccountNo
	GROUP BY VendorName, AccountDescription
	ORDER BY VendorName, AccountDescription

SELECT VendorName, AccountDescription, COUNT(*) AS LineItemCount,
       SUM(InvoiceLineItemAmount) AS LineItemSum
FROM Vendors v 
  JOIN Invoices i
   ON v.VendorID = i.VendorID
 JOIN InvoiceLineItems li
   ON i.InvoiceID = li.InvoiceID
 JOIN GLAccounts gl
   ON li.AccountNo = gl.AccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription;
--#8Write a SELECT statement that answers this question: 
--Which vendors are being paid from more than one account? 
--Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices. 
--Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo
SELECT *
	FROM Invoices
SELECT *
	FROM InvoiceLineItems
SELECT *
	FROM Vendors;

SELECT VendorName, COUNT(DISTINCT LI.AccountNo) AS NumberOfAccounts
	FROM Vendors V
	JOIN Invoices I 
	ON I.VendorID=V.VendorID
	JOIN InvoiceLineItems LI 
	ON LI.InvoiceID=I.InvoiceID

	GROUP BY VendorName
		HAVING COUNT(DISTINCT LI.AccountNo)>1
	ORDER BY VendorName DESC
--book solution
SELECT VendorName,
    COUNT(DISTINCT li.AccountNo) AS [# of Accounts]
	FROM Vendors v 
	JOIN Invoices i
    ON v.VendorID = i.VendorID
	JOIN InvoiceLineItems li
    ON i.InvoiceID = li.InvoiceID
	GROUP BY VendorName
	HAVING COUNT(DISTINCT li.AccountNo) > 1
	ORDER BY VendorName;

--#9 Write a SELECT statement that returns six columns: VendorID
--InvoiceDate InvoiceTotal VendorTotal VendorCount VendorAvg
-- From the Invoices table From the Invoices table From the Invoices table
--The sum of the invoice totals for each vendor The count of invoices for each vendor
--The average of the invoice totals for each vendor 
--The result set should include the individual invoices for each vendor
SELECT VendorID, 
	   InvoiceDate, 
	   InvoiceTotal, 
	   SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal, 
	   COUNT(*) OVER (PARTITION BY VendorID) AS VendorCount, 
	   AVG(InvoiceTotal) OVER (PARTITION BY VendorID) AS AvgInvoice
	FROM Invoices


