ALTER TABLE invoices
ADD CONSTRAINT payment_total_ck1 
        CHECK ((payment_date IS NULL     AND payment_total = 0) OR
               (payment_date IS NOT NULL AND payment_total > 0));
               
ALTER TABLE invoices               
ADD CONSTRAINT payment_total_ck2  
        CHECK (payment_total + credit_total <= invoice_total);
