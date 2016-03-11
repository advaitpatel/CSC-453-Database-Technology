SELECT invoice_number,
    TO_CHAR(invoice_total - credit_total - payment_total, '9,999,999.99') AS balance_due, 
    RANK() OVER 
        (ORDER BY invoice_total - credit_total - payment_total DESC) 
        As balance_rank
FROM invoices
WHERE invoice_total - credit_total - payment_total > 0