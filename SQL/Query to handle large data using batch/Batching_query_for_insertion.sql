CREATE PROCEDURE BatchInsertIndia
AS
BEGIN
    DECLARE @batch_size INT = 10000;   -- Number of records to process in each batch
    DECLARE @start INT = 0;             -- Starting point for the batch
    DECLARE @total_rows INT;             -- Variable to hold total row count

    -- Get total count of rows for the country 'IND'
    SELECT @total_rows = COUNT(*)
    FROM StagingTable
    WHERE country = 'IND';

    -- Process records in batches
    WHILE @start < @total_rows
    BEGIN
        -- Insert data into Table_India in batches
        INSERT INTO Table_India (customer_name, customer_id, open_date, last_consulted_date, vaccination_id, doctor_name, state, country, post_code, dob, is_active)
        SELECT customer_name, 
               customer_id, 
               CONVERT(DATE, open_date, 112), -- Converts to DATE format (YYYYMMDD)
               CONVERT(DATE, last_consulted_date, 112), -- Converts to DATE format (YYYYMMDD)
               vaccination_id, 
               doctor_name, 
               state, 
               country, 
               post_code, 
               CONVERT(DATE, dob, 112), -- Converts to DATE format (YYYYMMDD)
               is_active
        FROM StagingTable
        WHERE country = 'IND'
        ORDER BY customer_id -- Ensure consistent ordering
        OFFSET @start ROWS FETCH NEXT @batch_size ROWS ONLY; -- Use OFFSET for pagination

        SET @start = @start + @batch_size; -- Increment start position for the next batch
    END
END
GO
