-- Goal: Calculate the average stars given in reviews per month and product.

-- Selecting the month, product_id, and rounding the average stars to two decimal places
SELECT 
    EXTRACT(month FROM submit_date) as mth,
    product_id,
    ROUND(AVG(stars), 2) as avg_stars 
FROM 
    reviews
-- Grouping the result by month and product_id
GROUP BY 
    1, 2
-- Ordering the result by month and product_id
ORDER BY 
    1, 2;
