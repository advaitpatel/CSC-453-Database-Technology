CREATE OR REPLACE PROCEDURE insert_glaccount
(
  account_number_param        NUMBER,   
  account_description_param   VARCHAR2
)
AS
BEGIN
  INSERT INTO general_ledger_accounts
  VALUES (account_number_param, account_description_param);
  COMMIT;
END;
/

CALL insert_glaccount(700, 'Internet Services');
