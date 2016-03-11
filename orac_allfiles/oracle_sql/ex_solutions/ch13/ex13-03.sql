CONNECT ap/ap;
SET SERVEROUTPUT ON;

DECLARE
  CURSOR invoices_cursor IS
  SELECT vendor_name, invoice_number,
    invoice_total - payment_total - credit_total AS balance_due
  FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
  WHERE invoice_total - payment_total - credit_total >= 5000
  ORDER BY balance_due DESC;

  invoice_row invoices%ROWTYPE;
BEGIN  
  FOR invoice_row IN invoices_cursor LOOP   
    DBMS_OUTPUT.PUT_LINE(
      TO_CHAR(invoice_row.balance_due, '$99,999.99') || '    ' || 
      invoice_row.invoice_number || '    ' ||
      invoice_row.vendor_name);
  END LOOP;
END;
/
