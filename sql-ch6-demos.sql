--1.28-2025
--ch6 subqueries demos
--pg 161 return all invoices whose total>avg invoice total
SELECT *
	FROM Invoices;
SELECT AVG(InvoiceTotal)
	FROM Invoices;

SELECT InvoiceNumber,InvoiceDate,InvoiceTotal
	FROM Invoices
	WHERE InvoiceTotal>
		(SELECT AVG(InvoiceTotal)
		FROM Invoices)
	ORDER BY InvoiceTotal

--pg 163 query that uses an inner join 
--join invoices and vendors, show InvoiceNumber, InvoiceDate,InvoiceDate for invoice vendors from CA
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID=I.VendorID
	WHERE VendorState='CA'
	ORDER BY InvoiceDate

--same as subquery
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
	WHERE VendorID IN
	(SELECT VendorID
		FROM Vendors 
		WHERE VendorState='CA')
	ORDER BY InvoiceDate

--pg 165 vendors without invoices
SELECT VendorID, VendorName, VendorState
	FROM Vendors
	WHERE VendorID NOT IN
	(SELECT DISTINCT VendorID
	FROM Invoices)
	--looking for vendors who have NOT been invoiced

--without subquery by using join
SELECT I.VendorID, VendorName, VendorState
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorID=I.VendorID
	WHERE I.VendorID IS NULL

--pg 167