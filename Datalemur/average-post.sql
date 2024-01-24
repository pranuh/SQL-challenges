https://datalemur.com/questions/sql-average-post-hiatus-1

-- Selecting user_id and calculating the date difference for users with more than one post in 2021
SELECT 
    user_id,
    EXTRACT(DAYS FROM MAX(post_date) - MIN(post_date)) AS date
FROM 
    posts
WHERE 
    EXTRACT(YEAR FROM post_date) = 2021  -- Considering only posts from the year 2021
GROUP BY 
    user_id
HAVING 
    count(post_id) > 1;  -- Filtering out users with less than two posts
