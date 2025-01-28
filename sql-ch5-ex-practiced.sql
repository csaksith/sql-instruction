--1.28.2025
--ch5 exercise practice
--#9 Write a SELECT statement that returns six columns: 
-- VendorID InvoiceDate InvoiceTotal VendorTotal VendorCount VendorAvg
-- From the Invoices table From the Invoices table From the Invoices table
--The sum of the invoice totals for each vendor The count of invoices for each vendor
--The average of the invoice totals for each vendor 
--The result set should include the individual invoices for each vendor (over partition by)

SELECT VendorID, InvoiceDate, InvoiceTotal,
	   SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal, 
	   COUNT(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorCount, 
	   AVG(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorAvg
	FROM Invoices
	-- FOR EACH VENDOR
SELECT *
	FROM Invoices

-- must use partition due to invoicetotal is more value than invoice data

--#7Write a SELECT statement that returns four columns: 
--VendorName, Account-Description, LineItemCount, and LineItemSum. 
--LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column.
--For each vendor and account, return the number and sum of line items, 
--sorted first by vendor, then by account description.
-- 4 table join

SELECT TOP (5)*
	FROM Vendors
SELECT TOP (5)*
	FROM GLAccounts
SELECT TOP (5)*
	FROM Invoices
SELECT TOP (5)*
	FROM InvoiceLineItems
SELECT VendorName, 

--main table is invoices table 

SELECT VendorName, G.AccountDescription, COUNT(LI.InvoiceID) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM Invoices I
		JOIN Vendors V
			 ON V.VendorID=I.VendorID
		JOIN InvoiceLineItems LI
			 ON LI.InvoiceID=I.InvoiceID
		JOIN GLAccounts G
			 ON G.AccountNo=LI.AccountNo
		GROUP BY VendorName, G.AccountDescription
		ORDER BY VendorName, G.AccountDescription

SELECT *
	FROM Invoices
	WHERE InvoiceID=2;
SELECT *
	FROM Vendors
	WHERE VendorID=123;