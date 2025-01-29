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

--pg 167 invoice payment details, see balance due where BD is less than avg BD
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
	FROM Invoices
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal)>0
	AND (InvoiceTotal - PaymentTotal - CreditTotal)<
	(SELECT AVG(InvoiceTotal - PaymentTotal - CreditTotal)
		FROM Invoices
		WHERE (InvoiceTotal - PaymentTotal - CreditTotal)>0)
	ORDER BY InvoiceTotal DESC

--pg 169 ALL keyword
SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID =34
	--all invoices whose totals are >vendorid 34's invoices
SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID=I.VendorID
	WHERE InvoiceTotal>ALL
		(SELECT InvoiceTotal
			FROM Invoices
			WHERE VendorID =34)
	ORDER BY VendorName

--pg 171 how to use ANY and SOME
--invoice totals for vendorid 115
-- write out subquery first before main query
SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID=115
--invoices < any of vendor 115's
SELECT VendorName, InvoiceNumber,InvoiceTotal
	FROM Vendors V
	JOIN Invoices I ON I.VendorID=V.VendorID
WHERE InvoiceTotal<ANY
	(SELECT InvoiceTotal
	FROM Invoices
	WHERE VendorID=115)

---** Notes pg 172 for future interview question**--
--pg 173 correlated subquery

--show vendor invoices that are above their own average of invoices
SELECT VendorID,InvoiceNumber,InvoiceTotal
	FROM Invoices I1
	WHERE InvoiceTotal>
		(SELECT AVG(InvoiceTotal)
			FROM Invoices I2
			WHERE I2.VendorID=I1.VendorID)
--pg 175 WHERE EXISTS/NOT EXISTS
-- vendors without invoices
SELECT *
	FROM Vendors
SELECT VendorID, VendorName, VendorState
	FROM Vendors V
	WHERE NOT EXISTS
	(SELECT *
		FROM Invoices I
		WHERE I.VendorID=V.VendorID)

	ORDER BY VendorID,InvoiceTotal