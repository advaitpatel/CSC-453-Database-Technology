SET SERVEROUTPUT ON;

BEGIN
  insert_glaccount
  (
    account_description_param => 'Software Inventory Advanced',
    account_number_param => 130
  );
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('A DUP_VAL_ON_INDEX error occurred.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unknown exception occurred.');
END;
/