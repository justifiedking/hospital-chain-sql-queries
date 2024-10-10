-- Insert data into Table_India with derived columns
INSERT INTO Table_India
(customer_name, customer_id, open_date, last_consulted_date, vaccination_id, doctor_name, state, country, post_code, dob, is_active, age, days_since_last_consulted)
SELECT
    customer_name,
    customer_id,
    open_date,
    last_consulted_date,
    vaccination_id,
    doctor_name,
    state,
    country,
    post_code,
    dob,
    is_active,
    -- Derived column for age
    FLOOR(DATEDIFF(CURDATE(), dob) / 365) AS age,
    -- Derived column for days since last consulted
    DATEDIFF(CURDATE(), last_consulted_date) AS days_since_last_consulted
FROM
    StagingTable
WHERE
    country = 'IND'
    AND DATEDIFF(CURDATE(), last_consulted_date) > 30;


--Same query can be resued for entering data into ther copuntry tables by just changing table name and where clause first condition