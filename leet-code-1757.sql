SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';


# Alrernare solution

SELECT product_id 
FROM Products
WHERE low_fats = 1 AND recyclable = 1;
