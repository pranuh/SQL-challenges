[s](https://datalemur.com/questions/laptop-mobile-viewership)

-- Calculating the total number of views for 'laptop' devices
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  -- Calculating the total number of views for 'tablet' and 'phone' devices
  SUM(CASE WHEN device_type IN ('tablet','phone') THEN 1 ELSE 0 END) AS mobile_views
FROM 
  viewership;

