SELECT vendor_name, invoice_number AS oldest_invoice,
       oi.oldest_invoice_date, invoice_total
FROM invoices i JOIN
  (SELECT vendor_id, MIN(invoice_date) AS oldest_invoice_date
   FROM invoices
   GROUP BY vendor_id) oi
  ON (i.vendor_id = oi.vendor_id AND
      i.invoice_date = oi.oldest_invoice_date)
JOIN vendors v
  ON i.vendor_id = v.vendor_id
ORDER BY vendor_name
