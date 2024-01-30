-- Common Table Expression (CTE) named 'cte' to aggregate time spent on sending and opening activities by age bucket
WITH cte AS (
  SELECT 
    age_breakdown.age_bucket,
    SUM(CASE WHEN activity_type = 'send' THEN time_spent END) as time_spent_sending,
    SUM(CASE WHEN activity_type = 'open' THEN time_spent END) as time_spent_opening
  FROM 
    activities
  INNER JOIN 
    age_breakdown ON activities.user_id = age_breakdown.user_id
  GROUP BY 
    1
)

-- Selecting age_bucket and calculating the percentage of time spent on sending and opening activities
SELECT 
  age_bucket,
  ROUND((time_spent_sending / (time_spent_sending + time_spent_opening)) * 100.0, 2) as send_perc,
  ROUND((time_spent_opening / (time_spent_sending + time_spent_opening)) * 100.0, 2) as open_perc
FROM 
  cte;
