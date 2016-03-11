SET SERVEROUTPUT ON;

BEGIN
  IF test_glaccounts_description('Book Inventory') = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Account description is already in use.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Account description is available.');
  END IF;
END;
/