--1.29.2025 pg.212
--ch 7 exercises
--1 Write SELECT INTO statements to create two test tables named --VendorCopy and InvoiceCopy that are complete copies of the data --in the Vendors and Invoices tables.SELECT *	INTO VendorCopy	FROM VendorsSELECT *	INTO InvoiceCopy	FROM Invoices--#2 Write an INSERT statement that adds a row to the InvoiceCopy table with the following values:SELECT *
	FROM Invoices
INSERT INTO InvoiceCopy
	VALUES
	(32,'AX-014-027','2023-04-21',434.58,0.00,0.00,2,'2023-05-08',NULL)
SELECT *
	FROM InvoiceCopy
	WHERE VendorID=32
--#3  Write an INSERT statement that adds a row to the VendorCopy table for each non-California vendor in the Vendors table. 
(This will result in duplicate vendors in the VendorCopy table