--ch 4 exercise practice pg 132
--#1  Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.com
SELECT *
	FROM Vendors
	--or Vendors V
	JOIN Invoices
	--or Invoices I
		ON Invoices.VendorID=Vendors.VendorID;
	--or I.Invoices=V.Vendors;
SELECT * 
FROM Invoices;
SELECT *
	FROM Vendors;

--#2 The result set should have one row for each invoice with a non-zero balance.
-- Sort the result set by VendorName in ascending order.          
SELECT V.VendorName,I.InvoiceNumber,I.InvoiceDate,(InvoiceTotal-(PaymentTotal+CreditTotal)) AS Balance
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID=I.VendorID
	WHERE InvoiceTotal-(PaymentTotal+CreditTotal) >0
	ORDER BY VendorName;

	
SELECT VendorName, InvoiceNumber, InvoiceDate,
       InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM Vendors v
JOIN Invoices i
  ON v.VendorID = i.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName;

--#3
SELECT V.VendorName, V.DefaultAccountNo, G.AccountDescription
	FROM Vendors V
	JOIN GLAccounts G ON V.DefaultAccountNo=G.AccountNo
	ORDER BY G.AccountDescription, V.VendorName;
SELECT *
	FROM GLAccounts;
SELECT *
	FROM Vendors;
--#4 Generate the same result set described in exercise 2, but use the implicit join syntax.
SELECT V.VendorName, InvoiceNumber, InvoiceDate, (InvoiceTotal-(PaymentTotal+CreditTotal)) AS Balance
	FROM Vendors V, Invoices I
	WHERE V.VendorID=I.VendorID
	AND I.InvoiceTotal-(I.PaymentTotal+I.CreditTotal) >0
	ORDER BY V.VendorName;

SELECT VendorName, InvoiceNumber, InvoiceDate,
       InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM Vendors, Invoices
WHERE Vendors.VendorID = Invoices.VendorID
  AND InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName;

--#5
SELECT VendorName AS Vendor,InvoiceDate AS 'DATE', InvoiceNumber AS 'Number',InvoiceSequence AS '#' ,InvoiceLineItems AS LineItem
	FROM Vendors,Invoices,InvoiceArchive
	Join

SELECT *
	FROM Vendors;

SELECT
@@






















