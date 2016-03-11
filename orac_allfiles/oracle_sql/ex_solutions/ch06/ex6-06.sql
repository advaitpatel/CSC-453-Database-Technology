WITH invoice_max AS
    (SELECT vendor_id, MAX(invoice_total) AS invoice_max
     FROM invoices
     WHERE invoice_total - credit_total - payment_total > 0
     GROUP BY vendor_id)
SELECT SUM(invoice_max) AS sum_of_maximums
FROM invoice_max