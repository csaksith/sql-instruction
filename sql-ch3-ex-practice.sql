--ch 3 exercises 1.26.2025 pg 99
--#1 Write a SELECT statement that returns three columns from the Vendors table:--VendorContactFName, VendorContactLName, and VendorName. --Sort the result set by last name, then by first name.SELECT VendorContactFName,VendorContactLName,VendorName	FROM Vendors	ORDER BY VendorContactLName, VendorContactFName; --#2 SELECT statement that returns four columns from the Invoices table, named Number, Total, Credits, and Balance:
 SELECT InvoiceNumber AS Number,
		InvoiceTotal AS Total,
		PaymentTotal+CreditTotal AS Credits,
		InvoiceTotal-(PaymentTotal+CreditTotal) AS Balance
	FROM Invoices;
--#3 Write a SELECT statement that returns one column from the Vendors table named Full Name. 
--Create this column from the VendorContactFName and VendorContactLName columns. 
--Format it as follows: last name, comma, first name (for example, �Doe, John�). 
--Sort the result set by last name, then by first name.
SELECT VendorContactLName+', ' +VendorContactFName AS 'Full Name'
	FROM Vendors
	ORDER BY VendorContactLName, VendorContactFName;
--#4 Write a SELECT statement that returns three columns:--(For example, if InvoiceTotal is 100, 10% is 10, and Plus 10% is 110.) --Only return those rows with a balance due greater than 1000. --Sort the result set by InvoiceTotal, with the largest invoice first.SELECT InvoiceTotal, InvoiceTotal*.1 AS '10%',InvoiceTotal*1.1 AS 'Plus 10%'	FROM Invoices	WHERE InvoiceTotal - PaymentTotal-CreditTotal > 1000	ORDER BY InvoiceTotal DESC;SELECT InvoiceTotal, InvoiceTotal / 10 AS [10%],
       InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal DESC;--#5 Modify the solution to exercise 2 to filter for invoices --with an InvoiceTotal that�s greater than or equal to $500 but less than or equal to $10,000 SELECT InvoiceNumber AS Number,
		InvoiceTotal AS Total,
		PaymentTotal+CreditTotal AS Credits,
		InvoiceTotal-(PaymentTotal+CreditTotal) AS Balance
	FROM Invoices	WHERE InvoiceTotal >= 500 AND InvoiceTotal <=10000	ORDER BY InvoiceTotal DESC;--#6 Modify the solution to exercise 3 to filter for contacts whose last name begins with the letter A, B, C, or E (not D).SELECT VendorContactLName+', ' +VendorContactFName AS 'Full Name'
	FROM Vendors
	WHERE VendorContactLName LIKE ('[A-E]%') AND VendorContactLName NOT LIKE ('D%')
	ORDER BY VendorContactLName, VendorContactFName;
--#7 Write a SELECT statement that determines whether the PaymentDate column of the Invoices table has any invalid values. --To be valid, PaymentDate must be a null value if there�s a balance due and a non-null value if there�s no balance due. --Code a compound condition in the WHERE clause that tests for these conditions.SELECT *	FROM Invoices	WHERE (PaymentDate IS NULL AND (InvoiceTotal-PaymentTotal+CreditTotal)<0)	OR PaymentDate IS NOT NULL AND (InvoiceTotal-(PaymentTotal+CreditTotal))>0;
