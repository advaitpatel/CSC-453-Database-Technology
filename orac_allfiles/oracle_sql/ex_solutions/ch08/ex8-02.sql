SELECT invoice_date AS "Invoice Date",
       TO_CHAR(invoice_date, 'dd-Mon-yyyy hh24:mm:ss') AS "Full Date/Time 24h",
       TO_CHAR(invoice_date, 'dd-Mon-yyyy hh:mm:ss a.m.') AS "Full Date/Time 12h",
       CAST(invoice_date AS VARCHAR2(10)) AS "Character"
FROM Invoices