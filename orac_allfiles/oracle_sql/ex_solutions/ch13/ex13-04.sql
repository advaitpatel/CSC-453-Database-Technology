CONNECT ap/ap;
SET SERVEROUTPUT ON;

DECLARE
  CURSOR invoices_cursor IS
  SELECT vendor_name, invoice_number,
    invoice_total - payment_total - credit_total AS balance_due
  FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
  WHERE invoice_total - payment_total - credit_total >= 5000
  ORDER BY vendor_name;

  invoice_row invoices%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('$20,000 or More'); 
  FOR invoice_row IN invoices_cursor LOOP
    IF invoice_row.balance_due >= 20000 THEN
      DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(invoice_row.balance_due, '$99,999.99') || '    ' || 
        invoice_row.invoice_number || '    ' ||
        invoice_row.vendor_name);
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('$10,000 to $20,000'); 
  FOR invoice_row IN invoices_cursor LOOP
    IF invoice_row.balance_due >= 10000 
        AND invoice_row.balance_due < 20000 THEN
      DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(invoice_row.balance_due, '$99,999.99') || '    ' || 
        invoice_row.invoice_number || '    ' ||
        invoice_row.vendor_name);
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('$5,000 to $10,000'); 
  FOR invoice_row IN invoices_cursor LOOP
    IF invoice_row.balance_due >= 5000 
        AND invoice_row.balance_due < 10000 THEN
      DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(invoice_row.balance_due, '$99,999.99') || '    ' || 
        invoice_row.invoice_number || '    ' ||
        invoice_row.vendor_name);
    END IF;
  END LOOP;
END;
/