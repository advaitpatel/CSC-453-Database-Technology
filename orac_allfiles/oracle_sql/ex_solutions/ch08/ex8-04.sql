SELECT invoice_number,
       invoice_date,
       invoice_date + 30,
       payment_date,
       payment_date - invoice_date AS days_to_pay,
       TO_CHAR(invoice_date, 'mm') AS "MONTH",
       TO_CHAR(invoice_date, 'yyyy') AS "YEAR",
       LAST_DAY(invoice_date) AS last_invoice_date
FROM Invoices
WHERE invoice_date > '30-Apr-2014' AND invoice_date < '01-Jun-2014'