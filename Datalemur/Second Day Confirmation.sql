-- Journal Entry for Code Revision

-- Goal: Retrieve distinct user_id values where a confirmation text was sent one day after the user signed up via email.

-- Selecting distinct user_id values
SELECT DISTINCT 
    user_id
FROM 
    emails 
-- Inner joining the emails and texts tables on email_id
INNER JOIN 
    texts
ON 
    emails.email_id = texts.email_id
-- Filtering rows where the action_date in texts is one day after the signup_date in emails
WHERE 
    texts.action_date = emails.signup_date + INTERVAL '1 day'
-- Additional condition to ensure the signup action in texts is 'Confirmed'
AND 
    texts.signup_action = 'Confirmed';
