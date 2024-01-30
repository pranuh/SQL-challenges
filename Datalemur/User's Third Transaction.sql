-- Journal Entry for Code Revision

-- Goal: Retrieve the third transaction for each user based on transaction date.

-- Common Table Expression (CTE) named 'cte' to assign row numbers to transactions within each user_id
WITH cte AS (
  SELECT 
    row_number() OVER(PARTITION BY user_id ORDER BY transaction_date) AS row_num,
    *
  FROM 
    transactions
)

-- Selecting user_id, spend, and transaction_date for transactions where row number is 3
SELECT 
  user_id,
  spend,
  transaction_date
FROM 
  cte
WHERE 
  row_num = 3;
