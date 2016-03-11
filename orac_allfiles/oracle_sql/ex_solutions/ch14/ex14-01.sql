CONNECT ap/ap;

SET SERVEROUTPUT ON;

BEGIN
  UPDATE invoices
  SET vendor_id = 123
  WHERE vendor_id = 122;

  DELETE FROM vendors
  WHERE vendor_id = 122;

  UPDATE vendors
  SET vendor_name = 'FedUP'
  WHERE vendor_id = 123;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('The transaction was committed.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('The transaction was rolled back.');
END;
/