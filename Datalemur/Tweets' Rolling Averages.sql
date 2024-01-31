-- Goal: Calculate the rolling average of tweet counts for each user over a window of three consecutive rows.

-- Selecting user_id, tweet_date, and calculating the rolling average of tweet count for each user
SELECT 
  user_id,
  tweet_date,
  ROUND(
    AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
    2
  ) AS rolling_avg
FROM 
  tweets;
