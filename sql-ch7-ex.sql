--1.29.2025 pg.212
--ch 7 exercises
--1 Write SELECT INTO statements to create two test tables named 
--VendorCopy and InvoiceCopy that are complete copies of the data 
--in the Vendors and Invoices tables.
SELECT *
	INTO VendorCopy
	FROM Vendors
SELECT *
	INTO InvoiceCopy
	FROM Invoices
--#2 Write an INSERT statement that adds a row to the InvoiceCopy table with the following values:
SELECT *
	FROM Invoices
INSERT INTO InvoiceCopy
	VALUES
	(32,'AX-014-027','2023-04-21',434.58,0.00,0.00,2,'2023-05-08',NULL)
SELECT *
	FROM InvoiceCopy
	WHERE VendorID=32
--#3  Write an INSERT statement that adds a row to the VendorCopy table 
--for each non-California vendor in the Vendors table. 
--(This will result in duplicate vendors in the VendorCopy table
INSERT INTO VendorCopy
	SELECT VendorName, VendorAddress1, VendorAddress2,
       VendorCity, VendorState, VendorZipCode,
       VendorPhone, VendorContactLName, VendorContactFName,
       DefaultTermsID, DefaultAccountNo
	FROM Vendors
	WHERE VendorState <> 'CA'
	ORDER BY VendorState
SELECT *
	FROM VendorCopy
	ORDER BY 
--#4 Write an UPDATE statement that modifies the VendorCopy table.
--For each vendor that has an account number of 400, change the account number to 403.
UPDATE VendorCopy
SET DefaultAccountNo=403
WHERE DefaultAccountNo=400
--#5  Write an UPDATE statement that modifies the InvoiceCopy table.
--For each invoice with a balance due, change the PaymentDate to today’s date and the PaymentTotal to the balance due. 
--This simulates paying each invoice that has a balance due. 
--To set the date, use the GETDATE() function
UPDATE InvoiceCopy
	SET PaymentDate =  GETDATE(),
		PaymentTotal = InvoiceTotal - PaymentTotal
	WHERE InvoiceTotal-PaymentTotal-CreditTotal>0
SELECT *
	FROM InvoiceCopy

	SELECT *
	FROM VendorCopy

--#6  Write an UPDATE statement that modifies the InvoiceCopy table. 
--For each invoice that’s from a vendor with a DefaultTermsID of 2, 
--change the invoice TermsID to 2. To do this, use a subquery
UPDATE InvoiceCopy
	SET TermsID = 2
	WHERE VendorID IN
		(SELECT DefaultTermsID
			FROM VendorCopy
			WHERE DefaultTermsID = 2)
--#7 Solve exercise 6 using a join rather than a subquery.
UPDATE InvoiceCopy
	SET TermsID = 2
	FROM InvoiceCopy I
	JOIN VendorCopy V
		ON V.VendorID=I.VendorID
		WHERE DefaultTermsID = 2
--#8 . Write a DELETE statement that deletes all vendors in the state of Minnesota from the VendorCopy table
DELETE VendorCopy
	WHERE VendorState='MN'

--#9  Write a DELETE statement for the VendorCopy table that deletes vendors located in states from which no vendor has an invoice.--Hint: Use the NOT IN operator with a subquery that begins with “SELECT DISTINCT VendorState”DELETE VendorCopy	WHERE VendorState NOT IN		(SELECT DISTINCT VendorState			FROM Vendors V			JOIN Invoices I			ON V.VendorID=I.VendorID)