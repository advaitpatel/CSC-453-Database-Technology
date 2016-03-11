SELECT invoice_number AS "Number",
       invoice_total AS "Total",
       payment_total + credit_total AS "Credits",
       invoice_total - (payment_total + credit_total) AS "Balance Due"
FROM (SELECT * FROM invoices
      ORDER BY invoice_total - (payment_total + credit_total) DESC)
WHERE ROWNUM <= 10
