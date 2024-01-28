-- Goal: Retrieve the top 3 drugs with the highest total profit (total sales - cost of goods sold).

-- Selecting drug and calculating total profit for each drug
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM 
  pharmacy_sales
-- Ordering the result by total profit in descending order
ORDER BY 
  total_profit DESC
-- Limiting the result to the top 3
LIMIT 3;
