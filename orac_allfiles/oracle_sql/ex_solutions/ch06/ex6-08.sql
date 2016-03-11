SELECT vendor_name, invoice_number AS oldest_invoice,
       invoice_date, invoice_total
FROM invoices i_main JOIN vendors v
  ON i_main.vendor_id = v.vendor_id
WHERE invoice_date =
  (SELECT MIN(invoice_date)
   FROM invoices i_sub
   WHERE i_sub.vendor_id = i_main.vendor_id)
ORDER BY vendor_name
