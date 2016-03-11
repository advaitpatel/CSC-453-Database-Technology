ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR HH24:MI:SS';

SELECT invoice_number, invoice_date, 
  NUMTODSINTERVAL(SYSDATE - invoice_date, 'DAY') AS days_old
FROM invoices
WHERE SYSDATE - invoice_date > 30
ORDER BY days_old;