CONNECT ap/ap;
DROP ROLE payment_entry;
CREATE ROLE payment_entry;
GRANT CREATE SESSION to payment_entry;
GRANT SELECT, UPDATE
  ON vendors
  TO payment_entry;
GRANT SELECT, UPDATE
  ON invoices
  TO payment_entry;
GRANT SELECT, INSERT, UPDATE
  ON invoice_line_items
  TO payment_entry;