-- Goal: Calculate the weighted mean of item counts per order based on the provided formula.

-- Calculating the weighted mean of item counts per order
SELECT 
  ROUND(
    SUM(item_count::DECIMAL * order_occurrences)
    / SUM(order_occurrences)
  , 1) AS mean
FROM 
  items_per_order;

"It's important to note that both item_count and order_occurrences are of integer type by default,
which means that division will return an integer result. To ensure that the output is rounded to 1 decimal place, 
we can cast either column to a decimal type using :: DECIMAL or CAST(field AS decimal)"
