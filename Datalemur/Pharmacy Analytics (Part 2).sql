-- Goal: Retrieve the manufacturers with the highest total losses (where total sales minus cost of goods sold is less than or equal to zero).

-- Selecting manufacturer, counting drugs, and calculating total loss for each manufacturer
SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM 
  pharmacy_sales
-- Filtering rows where total sales minus cogs is less than or equal to zero
WHERE 
  total_sales - cogs <= 0
-- Grouping the result by manufacturer
GROUP BY 
  1
-- Ordering the result by total loss in descending order
ORDER BY 
  total_loss DESC;
