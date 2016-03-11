SELECT vendor_name, invoice_date, invoice_number, 
       invoice_sequence AS li_sequence,
       line_item_amt AS li_amount
FROM vendors ven JOIN invoices inv
  ON ven.vendor_id = inv.vendor_id
 JOIN invoice_line_items li
   ON inv.invoice_id = li.invoice_id
ORDER BY vendor_name, invoice_date, invoice_number, invoice_sequence
