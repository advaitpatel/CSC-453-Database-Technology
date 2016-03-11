SELECT account_description, COUNT(*) AS line_item_count,
       SUM(line_item_amt) AS line_item_amt_sum
FROM general_ledger_accounts gl JOIN invoice_line_items li
  ON gl.account_number = li.account_number
GROUP BY gl.account_description
HAVING COUNT(*) > 1
ORDER BY line_item_amt_sum DESC
