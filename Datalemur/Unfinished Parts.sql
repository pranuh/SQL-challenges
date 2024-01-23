(https://datalemur.com/questions/tesla-unfinished-parts)

-- Selecting part and assembly_step from the parts_assembly table
SELECT part, assembly_step
FROM parts_assembly
-- Filtering rows where finish_date is NULL
WHERE finish_date IS NULL;
