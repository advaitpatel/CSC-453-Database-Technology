CREATE OR REPLACE PROCEDURE insert_glaccount_with_test
(
  account_number_param        NUMBER,   
  account_description_param   VARCHAR2
)
AS
BEGIN
  IF test_glaccounts_description(account_description_param) = 1 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Duplicate account description.');
  ELSE
    INSERT INTO general_ledger_accounts
    VALUES (account_number_param, account_description_param);
    COMMIT;
  END IF;
END;
/