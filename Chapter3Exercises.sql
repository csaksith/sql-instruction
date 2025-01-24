-- Ex1:  Write a SELECT statement that returns three columns from the Vendors table: VendorContactFName, VendorContactLName, and VendorName. Sort the result set by last name, then by first name
SELECT VendorContactFName, VendorContactLName, VendorName
	FROM Vendors
	ORDER BY VendorContactLName, VendorContactFName;
--Ex2: Write a SELECT statement that returns four columns from the Invoices table, named Number, Total, Credits, and Balance:
SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, CreditTotal AS Credits, (InvoiceTotal-(PaymentTotal+CreditTotal)) AS Balance
	From Invoices;
--Ex3: 
SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
	FROM Vendors
	ORDER BY VendorContactLName, VendorContactFName;
--Ex4:
SELECT InvoiceTotal, (InvoiceTotal/10) AS [10%], (InvoiceTotal+1.1 ) AS [Plus 10%]
	FROM Invoices
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
	ORDER BY InvoiceTotal DESC
--Ex5:
SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, CreditTotal AS Credits, (InvoiceTotal-(PaymentTotal+CreditTotal)) AS Balance
	From Invoices
	WHERE InvoiceTotal >=500 AND InvoiceTotal <= 10000;
--Ex6:
SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
	FROM Vendors
	WHERE VendorContactLName LIKE '[A,B,C,E]%' AND VendorContactLName NOT LIKE 'D%'
	ORDER BY VendorContactLName, VendorContactFName;
--Ex7:
SELECT *
	FROM Invoices
	WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <=0) AND 
	PaymentDate IS NULL) OR ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND 
	PaymentDate IS NOT NULL);
-- 1/24 Exercise
-- #3 Write a SELECT statement that returns one column from the Vendors table named Full Name. 
-- Create this column from the VendorContactFName and VendorContactLName columns. 
-- Format it as follows: last name, comma, first name (for example, “Doe, John”). 
-- Sort the result set by last name, then by first name.
SELECT (VendorContactLName+ ', '+ VendorContactFName) AS 'Full Name'
	FROM Vendors
	ORDER BY VendorContactLName, VendorContactFName;
--#6 Modify the solution to exercise 3 to filter for contacts whose last name begins with the letter A, B, C, or E (not D).
SELECT (VendorContactLName+ ', '+ VendorContactFName) AS 'Full Name'
	FROM Vendors
	WHERE VendorContactLName LIKE '[A,B,C,E]%' AND VendorContactLName NOT LIKE 'D%'
	ORDER BY VendorContactLName, VendorContactFName;
--#7  Write a SELECT statement that determines whether the PaymentDate column of the Invoices table has any invalid values. -- To be valid, PaymentDate must be a null value if there’s a balance due and a non-null value if there’s no balance due. -- Code a compound condition in the WHERE clause that tests for these conditions.SELECT InvoiceNumber, PaymentDate, (InvoiceTotal - PaymentTotal - CreditTotal) as BalanceDue
	From Invoices
	WHERE (PaymentDate IS NULL)
	AND (InvoiceTotal - PaymentTotal - CreditTotal) = 0
	OR PaymentDate IS NOT NULL
	AND (InvoiceTotal - PaymentTotal - CreditTotal) > 0;
