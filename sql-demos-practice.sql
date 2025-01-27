--1.25.25 ch 1 demos
--join data from 2 or more tables
SELECT *
	FROM Vendors
	INNER JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	INNER JOIN InvoiceLineItems
		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID;
		
--ch 2 demos
SELECT *
	FROM Invoices;
-- InvoiceID = Primary Key
-- VendorID = Foreign Key
-- #9
SELECT VendorName, VendorState
	FROM Vendors
	WHERE VendorState='CA';

--ch 3 demos
--pg 65 select statemnt that retrieve all the data from the invoices table
SELECT *
	FROM Invoices;
-- pg 65 select statement that retrieve 3 columns from each row, sorted in ascending sequence by invoice total
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
	ORDER BY InvoiceTotal;
-- pg 65 select statement that retrieves 2 columns and calculated value for specific inoice
SELECT InvoiceID, InvoiceTotal, CreditTotal+PaymentTotal AS TotalCredits
	FROM Invoices
	WHERE InvoiceID=17;
--pg 69 select statement that names columns in the results
SELECT InvoiceNumber AS [Invoice Number], InvoiceDate AS Date, InvoiceTotal AS Total
	FROM Invoices;
--pg 69 SELECT statement that doesn't provide a name for a calculated column
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal
	FROM Invoices;
