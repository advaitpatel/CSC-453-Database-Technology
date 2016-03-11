CONNECT ap/ap;
SET SERVEROUTPUT ON;

DECLARE
  invoice_count   NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO invoice_count
  FROM invoices
  WHERE (invoice_total - payment_total - credit_total >= 5000);
  
  DBMS_OUTPUT.PUT_LINE(invoice_count || ' invoices exceed $5000.');
END;
