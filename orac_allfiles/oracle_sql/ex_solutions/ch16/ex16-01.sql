CREATE OR REPLACE TRIGGER invoices_before_update_payment
BEFORE UPDATE OF payment_total
ON invoices
FOR EACH ROW 
WHEN (new.payment_total + old.credit_total > old.invoice_total)
BEGIN
  RAISE_APPLICATION_ERROR(-20001, 
    'Payment total + credit total can not be greater than invoice total.');
END;
/

UPDATE invoices
SET payment_total = 300
WHERE invoice_id = 112;

SELECT invoice_id, invoice_total, credit_total, payment_total
FROM invoices
WHERE invoice_id = 112;