SELECT vendor_name
FROM vendors
WHERE vendor_id IN
     (SELECT vendor_id FROM invoices)
ORDER BY vendor_name
