-- Goal: Calculate the difference between the maximum and minimum issued amounts for each card, ordered by the difference in descending order.

-- Selecting card_name and calculating the difference between maximum and minimum issued amounts
SELECT 
    card_name,
    MAX(issued_amount) - MIN(issued_amount) as difference
FROM 
    monthly_cards_issued
-- Grouping the result by card_name
GROUP BY 
    1
-- Ordering the result by the calculated difference in descending order
ORDER BY 
    2 DESC;
