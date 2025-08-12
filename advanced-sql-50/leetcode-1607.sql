-- Write your PostgreSQL query statement below

SELECT DISTINCT seller_name 
FROM Seller
WHERE seller_name NOT IN (
    SELECT s.seller_name
    FROM Orders o
    LEFT JOIN Seller s
    ON o.seller_id = s.seller_id
    WHERE EXTRACT(YEAR FROM o.sale_date) = 2020
)  
ORDER BY seller_name