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
SELECT VendorName AS Vendor,InvoiceDate AS 'Date', InvoiceNumber AS 'Number',InvoiceSequence AS '#' ,InvoiceLineItemAmount AS LineItem
	FROM Vendors V
	JOIN Invoices I
	ON I.VendorID=V.VendorID
	JOIN InvoiceLineItems LI
	ON LI.InvoiceID=I.InvoiceID
	ORDER BY Vendor, 'Date','Number','#',LineItem 
	

SELECT *
	FROM Vendors;
SELECT *
	FROM Invoices;
SELECT *
	FROM InvoiceLineItems;

--#6 Write a SELECT statement that returns three columns: VendorID, VendorName, Name--From the Vendors table From the Vendors table--A concatenation of VendorContactFName and VendorContactLName, with a space in between--The result set should have one row for each vendor whose contact has the same first name as another vendor’s contact. 
--Sort the final result set by Name. Hint: Use a self-join.

SELECT DISTINCT V1.VendorID, V1.VendorName, V1.VendorContactFName +' '+V1.VendorContactLName AS ContactName
	FROM Vendors V1
	JOIN Vendors V2
	ON V1.VendorID<>V2.VendorID
	AND V1.VendorContactFName=V2.VendorContactFName
	ORDER BY ContactName

--#7  Write a SELECT statement that returns two columns from the GLAccounts table: --AccountNo and AccountDescription. The result set should have one row for each account number that has never been used. --Sort the final result set by AccountNo. Hint: Use an outer join to the InvoiceLineItems table.SELECT G.AccountNo, G.AccountDescription	FROM GLAccounts G	LEFT JOIN InvoiceLineItems LI	ON LI.AccountNo=G.AccountNo	WHERE LI.AccountNo IS NULL	ORDER BY G.AccountNoSELECT *	FROM InvoiceLineItems-- from solution
SELECT gl.AccountNo, AccountDescription
FROM GLAccounts gl
LEFT JOIN InvoiceLineItems li
  ON gl.AccountNo = li.AccountNo
WHERE li.AccountNo IS NULL
ORDER BY gl.AccountNo;















