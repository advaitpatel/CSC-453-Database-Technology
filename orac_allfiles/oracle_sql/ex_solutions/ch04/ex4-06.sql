SELECT gl.account_number, account_description
FROM general_ledger_accounts gl LEFT JOIN invoice_line_items li
  ON gl.account_number = li.account_number
WHERE li.account_number IS NULL
ORDER BY gl.account_number
