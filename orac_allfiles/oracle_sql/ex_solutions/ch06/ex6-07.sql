SELECT vendor_name, vendor_city, vendor_state
FROM vendors
WHERE vendor_state || vendor_city NOT IN 
    (SELECT vendor_state || vendor_city
    FROM vendors
    GROUP BY vendor_state || vendor_city
    HAVING COUNT(*) > 1)
ORDER BY vendor_state, vendor_city
