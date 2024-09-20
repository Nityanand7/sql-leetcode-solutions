SELECT p.product_name, s.year, s.price
FROM Sales s 
LEFT JOIN Product P
on s.product_id = p.product_id
