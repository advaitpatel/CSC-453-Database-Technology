SELECT vendor_name,
    UPPER(vendor_name),
    vendor_phone,
    SUBSTR(vendor_phone, 11) AS last_digits,
    SUBSTR(vendor_name, (INSTR(vendor_name, ' ') + 1),
        (INSTR(vendor_name, ' ', (INSTR(vendor_name, ' ') + 1)) - (INSTR(vendor_name, ' '))))
        AS second_word,
    REPLACE((REPLACE((REPLACE(vendor_phone, '(', '')), ') ', '-')), '-', '.') AS phone_with_dots
FROM Vendors

