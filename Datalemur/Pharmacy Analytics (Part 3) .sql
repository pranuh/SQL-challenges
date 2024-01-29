-- Goal: Retrieve the manufacturers with their total sales represented in million dollars.

-- Selecting manufacturer and formatting total sales in million dollars
SELECT
  manufacturer,
  '$' || ROUND(SUM(total_sales) / 1e6, 0) || ' million' AS formatted_total_sales
FROM 
  pharmacy_sales
-- Grouping the result by manufacturer
GROUP BY 
  1
-- Ordering the result by total sales in descending order and manufacturer in ascending order
ORDER BY 
  SUM(total_sales) DESC, 1 ASC;
