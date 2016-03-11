CONNECT ap/ap;
SET SERVEROUTPUT ON;

DECLARE
  count_balance_due   NUMBER;
  total_balance_due   NUMBER(9,2);
BEGIN
  SELECT COUNT (*), SUM(invoice_total - payment_total - credit_total)
  INTO count_balance_due, total_balance_due
  FROM invoices
  WHERE invoice_total - payment_total - credit_total > 0;

  IF total_balance_due >= 65000 THEN
    DBMS_OUTPUT.PUT_LINE('Number of unpaid invoices is ' || count_balance_due || '.');
    DBMS_OUTPUT.PUT_LINE('Total balance due is $' || total_balance_due || '.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Total balance due is less than $50,000.');
  END IF;
END;
/
