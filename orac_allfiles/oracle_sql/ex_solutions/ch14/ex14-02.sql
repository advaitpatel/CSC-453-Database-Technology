CONNECT ap/ap;

SET SERVEROUTPUT ON;

BEGIN
  DELETE FROM invoice_line_items
  WHERE invoice_id = 114;

  DELETE FROM invoices
  WHERE invoice_id = 114;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('The transaction was committed.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('The transaction was rolled back.');
END;
/