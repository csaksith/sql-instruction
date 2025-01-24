-- Chapter 4 exercises pg 132
--#1 Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.
SELECT *
	FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID;
--#2
SELECT VendorName, I.InvoiceNumber, I.InvoiceDate, (I.InvoiceTotal-(I.PaymentTotal+I.CreditTotal)) AS Balance
	FROM Vendors V
		JOIN Invoices I ON V.VendorID = I.VendorID
		WHERE (I.InvoiceTotal-(I.PaymentTotal+I.CreditTotal)) <> 0
		ORDER BY VendorName;
--#3
SELECT VendorName, DefaultAccountNo, AccountDescription
	From Vendors V
	JOIN GLAccounts G ON V.DefaultAccountNo = G.AccountNo;
--#4 use implicit join syntax from #2
SELECT VendorName, I.InvoiceNumber, I.InvoiceDate, (I.InvoiceTotal-(I.PaymentTotal+I.CreditTotal)) AS Balance
	FROM Vendors V, Invoices I
		WHERE V.VendorID = I.VendorID
		ORDER BY VendorName;
--#5 join multiple tables
SELECT V.VendorName AS Vendor,
	   I.InvoiceDate AS Date, 
	   I.InvoiceNumber AS Number, 
	   I.InvoiceSequence AS #,
	   I.InvoiceLineItemAmount AS LineItem
	FROM Vendor V
	JOIN
	JOIN Invoicelineitems ii ON I.invoiceID = ii.invoiceID;

SELECT *
	FROM Vendors;

SELECT *
	FROM Invoices;

SELECT *
	FROM InvoiceLineItems;
