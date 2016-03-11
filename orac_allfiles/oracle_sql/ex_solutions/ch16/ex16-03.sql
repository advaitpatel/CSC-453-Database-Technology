CREATE OR REPLACE VIEW balance_due_view AS 
  SELECT vendor_name, invoice_number, 
         invoice_total, payment_total, credit_total, 
         invoice_total - payment_total - credit_total AS balance_due
  FROM vendors JOIN invoices ON vendors.vendor_id = invoices.vendor_id
  WHERE invoice_total - payment_total - credit_total > 0;

CREATE OR REPLACE TRIGGER invoices_instead_of_insert
INSTEAD OF INSERT
ON balance_due_view
DECLARE
  vendor_id_var NUMBER;
BEGIN
  SELECT vendor_id
  INTO vendor_id_var
  FROM vendors
  WHERE vendor_name = :new.vendor_name;
  
  -- this uses the stored procedure from figure 15-05
  insert_invoice(vendor_id_var, :new.invoice_number, SYSDATE, :new.invoice_total);
END;
/

INSERT INTO balance_due_view VALUES
('Blue Cross', '555555555', 300, 0, 0, 0);

SELECT *
FROM balance_due_view;

-- clean up
DELETE FROM invoices WHERE invoice_number = '555555555';