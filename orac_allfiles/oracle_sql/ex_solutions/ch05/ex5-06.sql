SELECT account_number, SUM(line_item_amt) AS line_item_sum
FROM invoice_line_items
GROUP BY ROLLUP(account_number)
