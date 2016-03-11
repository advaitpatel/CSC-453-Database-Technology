SELECT vendor_name, SUM(payment_total) AS payment_total_sum
FROM vendors JOIN invoices
  ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendor_name
ORDER BY payment_total_sum DESC
