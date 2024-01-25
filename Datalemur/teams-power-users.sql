https://datalemur.com/questions/teams-power-users


-- Selecting sender_id and counting the number of messages for each sender in August 2022
SELECT 
    sender_id,
    COUNT(message_id) as msg_count 
FROM 
    messages
-- Filtering messages sent in August 2022
WHERE 
    EXTRACT(month FROM sent_date) = 8
    AND EXTRACT(year FROM sent_date) = 2022
-- Grouping the result by sender_id
GROUP BY 
    sender_id 
-- Ordering the result by msg_count in descending order
ORDER BY 
    msg_count DESC
-- Limiting the result to the top 2 senders
LIMIT 2;
