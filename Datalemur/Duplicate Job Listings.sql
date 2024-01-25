-- Common Table Expression (CTE) named 'cte' to count the number of titles for each company with more than one title
WITH cte (company_id, title_count) AS (
    SELECT 
        company_id,
        COUNT(title)  -- Counting the number of titles for each company
    FROM 
        job_listings
    GROUP BY 
        company_id
    HAVING 
        COUNT(title) > 1  -- Filtering companies with more than one title
)

-- Main query to count the number of companies with more than one title
SELECT 
    COUNT(title_count)  -- Counting the number of companies from the CTE
FROM 
    cte;
