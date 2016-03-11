SELECT invoice_total AS "Invoice Total",
       TO_CHAR(invoice_total, '9,999,999.99') AS "Char 9,999,999.99",
       TO_CHAR(invoice_total, '9,999,999') AS "Char 9,999,999",
       CAST(invoice_total AS NUMBER(7)) AS "Integer"
FROM Invoices
