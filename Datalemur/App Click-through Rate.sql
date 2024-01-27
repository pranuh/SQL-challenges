-- Goal: Calculate the Click-Through Rate (CTR) for each app based on events in the year 2022.

-- Common Table Expression (CTE) named 'cte' to calculate impression and click counts for each app
WITH cte (app_id, impression_count, click_count) AS (
    SELECT 
        app_id,
        SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impression_count,
        SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS click_count
    FROM 
        events
    WHERE 
        EXTRACT(year FROM timestamp) = '2022'
    GROUP BY 
        app_id
)

-- Main query to select app_id and calculate the Click-Through Rate (CTR) for each app
SELECT 
    app_id,
    ROUND(100.0 * click_count / impression_count, 2) AS ctr
FROM 
    cte;
