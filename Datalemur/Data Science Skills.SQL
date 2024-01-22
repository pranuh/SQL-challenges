"""
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
"""

-- Selecting candidate_id from the candidate's table
SELECT candidate_id
FROM candidates
-- Filtering candidates with skills in 'Python', 'Tableau', and 'PostgreSQL'
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
-- Grouping the result by candidate_id to count the number of distinct skills for each candidate
GROUP BY candidate_id
-- Filtering candidates who have exactly three distinct skills
HAVING COUNT(skill) = 3
-- Ordering the result in ascending order of candidate_id
ORDER BY candidate_id;

(alternate solution)

-- Common Table Expression (CTE) named 'cte' to calculate the skill indicator for each candidate
WITH cte (candidate_id, skill) AS (
    SELECT 
        candidate_id,
        CASE
            WHEN SKILL = 'Python' THEN 1
            WHEN SKILL = 'PostgreSQL' THEN 1
            WHEN SKILL = 'Tableau' THEN 1
            ELSE 0
        END AS skill_indicator  -- Assigning a value of 1 or 0 based on the presence of specific skills
    FROM 
        candidates
)

-- Main query to select candidate_id for candidates with all three specified skills
SELECT 
    candidate_id
FROM 
    cte
GROUP BY 
    candidate_id
HAVING 
    SUM(skill) = 3  -- Filtering candidates with a total skill indicator value of 3
ORDER BY 
    candidate_id ASC;  -- Ordering the result in ascending order of candidate_id
