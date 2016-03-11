CREATE OR REPLACE FUNCTION test_glaccounts_description
(
   account_description_param VARCHAR2
)
RETURN NUMBER
AS 
  duplicate_description_var  NUMBER;
BEGIN
  SELECT 1
  INTO duplicate_description_var
  FROM general_ledger_accounts
  WHERE account_description = account_description_param;
  
  RETURN duplicate_description_var;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/