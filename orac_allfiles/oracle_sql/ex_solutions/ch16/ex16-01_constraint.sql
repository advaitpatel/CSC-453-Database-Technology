ALTER TABLE invoices
ADD CONSTRAINT invoice_total_ck CHECK (payment_total + credit_total <= invoice_total);

-- clean up
ALTER TABLE invoices
DROP CONSTRAINT invoice_total_ck;