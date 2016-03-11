CREATE PUBLIC SYNONYM vendors FOR ap.vendors;
CREATE PUBLIC SYNONYM invoices FOR ap.invoices;
CREATE PUBLIC SYNONYM line_items FOR ap.invoice_line_items;

SELECT * FROM vendors;
SELECT * FROM invoices;
SELECT * FROM line_items;
