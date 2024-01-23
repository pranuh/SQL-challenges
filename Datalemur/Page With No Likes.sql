" Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs."

-- Selecting page_id from the pages table
SELECT pages.page_id
FROM pages
-- Performing a LEFT JOIN with the page_likes table based on page_id
LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
-- Filtering pages where liked_date is NULL (indicating no likes)
WHERE liked_date IS NULL
-- Ordering the result in ascending order by the first column (page_id)
ORDER BY 1;


