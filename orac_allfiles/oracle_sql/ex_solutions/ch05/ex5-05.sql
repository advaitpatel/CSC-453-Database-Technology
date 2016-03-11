SELECT account_description, COUNT(*) AS line_item_count,
       SUM(line_item_amt) AS line_item_amt_sum
FROM general_ledger_accounts gl JOIN invoice_line_items li
  ON gl.account_number = li.account_number
 JOIN invoices i
   ON li.invoice_id = i.invoice_id
WHERE invoice_date BETWEEN '01-Apr-2008' AND '30-June-2008'
GROUP BY gl.account_description
HAVING COUNT(*) > 1
ORDER BY line_item_amt_sum DESC

