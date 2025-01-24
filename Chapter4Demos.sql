--chapter 4 demos pg 103 two table join 
-- vendors and invoices table
SELECT *
	FROM Vendors
	ORDER BY VendorID;

SELECT InvoiceNumber, VendorName
	FROM Invoices
	JOIN Vendors on Vendors.VendorID = Invoices.VendorID;
	--ALL vendors who have been invoiced

--pg 105 alias in joins
SELECT InvoiceNumber, VendorName
	FROM Invoices AS Inv
	JOIN Vendors AS Ven on Vendors.VendorID = Inv.VendorID;

--simple simple
SELECT InvoiceNumber, VendorName
	FROM Invoices AS I
	JOIN Vendors AS V on V.VendorID = I.VendorID;

-- simple cubed
SELECT InvoiceNumber, VendorName
	FROM Invoices I
	JOIN Vendors V on V.VendorID = I.VendorID;

--add in a calculated column, where, order by
SELECT InvoiceNumber, VendorName, InvoiceDueDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
	FROM Invoices I
	JOIN Vendors V on V.VendorID = I.VendorID
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) >0
	Order BY InvoiceDueDate DESC;

--pg 109 joining on multiple things
-- Invoices to InvoiceLineItems and InvoiceTotal to InvoiceLineItemAmount
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount	
	FROM Invoices I
	JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
	AND I.InvoiceTotal > LI.InvoiceLineItemAmount
	ORDER BY InvoiceNumber;

--Change 2nd condition to a where clause
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount	
	FROM Invoices I
	JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
	WHERE I.InvoiceTotal > LI.InvoiceLineItemAmount
	ORDER BY InvoiceNumber;

-- pg 111 Vendors Table - self join
-- vendors from cities in common with other vendors
SELECT DISTINCT V1.VendorName, V1.VendorCity,V1.VendorState
	FROM Vendors V1
	JOIN Vendors V2 ON V1.VendorCity = V2.VendorCity
						AND V1.VendorState = V2.VendorState
						AND V1.VendorID <> V2.VendorID	
	ORDER BY V1.VendorState, V1.VendorCity;
-- pg 115 implicit join - vendors and invoices (vendors who have invoices)
SELECT InvoiceNumber, VendorName
	FROM Invoices I, Vendors V
	WHERE V.VendorID = I.VendorID;

--left outer join vendors & invoices
-- we want ALL data from vendors (122 records) and invoices (114 records)) data if exists
SELECT VendorName, InvoiceNumber,InvoiceTotal
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorID = I.VendorID
		ORDER BY VendorName;

--same thing as right outer join
SELECT VendorName, InvoiceNumber,InvoiceTotal
	FROM Invoices I
	RIGHT JOIN Vendors V ON V.VendorID = I.VendorID
		ORDER BY VendorName;

-- vendors and invoices I left outer join where invoiceNumber is NULL
--which vendors have we NOT done business with? (don't appear in the invoices table)?
SELECT VendorName, InvoiceNumber,InvoiceTotal
	FROM Vendors V
	LEFT JOIN Invoices I ON V.VendorID = I.VendorID
		WHERE InvoiceNumber is NULL
		ORDER BY VendorName;