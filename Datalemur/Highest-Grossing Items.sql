-- Common Table Expression (CTE) named 'cte' to calculate total spend and product ranking within each category
WITH cte AS (
  -- Selecting category, product, and sum of spend, and calculating product ranking within each category
  SELECT 
    category,
    product,
    SUM(spend) as total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) as product_ranking
  FROM 
    product_spend
  WHERE 
    EXTRACT(year FROM transaction_date) = 2022
  GROUP BY 
    1, 2
)

-- Selecting category, product, and total spend from the CTE where product ranking is within the top 2
SELECT 
  category,
  product,
  total_spend
FROM 
  cte
WHERE 
  product_ranking <= 2
-- Ordering the result by category and product ranking
ORDER BY 
  1, product_ranking;
