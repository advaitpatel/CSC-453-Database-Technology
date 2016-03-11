CONNECT ap/ap;
SET SERVEROUTPUT ON;

VARIABLE balance_due_minimum NUMBER;
BEGIN
  :balance_due_minimum := &balance_due_minimum;
END;
/

DECLARE
  CURSOR invoices_cursor IS
  SELECT vendor_name, invoice_number,
    invoice_total - payment_total - credit_total AS balance_due
  FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
  WHERE invoice_total - payment_total - credit_total >= :balance_due_minimum
  ORDER BY vendor_name;

  invoice_row invoices%ROWTYPE;
BEGIN
  dbms_output.put_line(' '); 
  dbms_output.put_line('Invoice amounts greater than or equal to $' || 
    :balance_due_minimum);
  dbms_output.put_line('===================================================');
  FOR invoice_row IN invoices_cursor LOOP   
    DBMS_OUTPUT.PUT_LINE(
      TO_CHAR(invoice_row.balance_due, '$99,999.99') || '    ' || 
      invoice_row.invoice_number || '    ' ||
      invoice_row.vendor_name);
  END LOOP;
END;
/