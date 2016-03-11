SELECT invoice_total - payment_total - credit_total AS balance_due,
       payment_date
FROM invoices
WHERE payment_date IS NULL AND invoice_total - payment_total - credit_total = 0
