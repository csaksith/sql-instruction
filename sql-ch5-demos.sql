--1.27.2025
--ch5 pg 137 # of invoices, sum total due where total due > 0
SELECT *
	FROM Invoices;

SELECT InvoiceNumber, (InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices;

SELECT COUNT(*)
	FROM Invoices;
	-- how many invoices have a balance due?
SELECT COUNT(*) AS NumberOfInvoices, SUM(InvoiceTotal-PaymentTotal-CreditTotal)  AS TotalDue
	FROM Invoices
	WHERE InvoiceTotal-PaymentTotal-CreditTotal>0;

-- how many total invoices, avg inv total, total inv amount? for invoices after 7/1/22?
SELECT 'After 7/1/2022' AS SelectionDate,
		COUNT(*) AS NumberOfInvoices,
		AVG(InvoiceTotal) AS AvgInvoiceAmount,
		SUM(InvoiceTotal) AS TotalInvoiceAmount
		FROM Invoices
		WHERE InvoiceDate >'2022-07-01';