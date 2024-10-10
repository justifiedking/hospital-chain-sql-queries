-- Ensure mandatory fields are not null
SELECT * FROM StagingTable
WHERE customer_name IS NULL OR customer_id IS NULL OR open_date IS NULL;


-- Check if dates are in correct format (YYYYMMDD)
SELECT * FROM StagingTable
WHERE STR_TO_DATE(open_date, '%Y%m%d') IS NULL OR STR_TO_DATE(dob, '%Y%m%d') IS NULL;


-- Ensure last consulted date is not in the future
SELECT * FROM StagingTable
WHERE last_consulted_date > CURDATE();
