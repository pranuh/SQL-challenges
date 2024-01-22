""" 
  write a query to obtain a histogram of tweets posted per user in 2022.
  Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
  In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.
  """

-- Common Table Expression (CTE) named 'cte' to calculate the count of tweets for each user in the year 2022 and onwards
WITH cte (user_id, count_tweet) AS (
    SELECT 
        user_id,
        COUNT(tweet_id)  -- Counting the number of tweets for each user
    FROM 
        tweets
    WHERE 
        EXTRACT(YEAR FROM tweet_date) >= 2022  -- Filtering tweets from the year 2022 and onwards
    GROUP BY 
        user_id  -- Grouping by user_id to get counts for each user
)

-- Main query to count the number of users for each tweet bucket and order the result by tweet_bucket
SELECT 
    count_tweet AS tweet_bucket,
    COUNT(user_id) AS user_count  -- Counting the number of users for each tweet bucket
FROM 
    cte
GROUP BY 
    tweet_bucket  -- Grouping by tweet_bucket
ORDER BY 
    tweet_bucket ASC;  -- Ordering the result in ascending order of tweet_bucket
