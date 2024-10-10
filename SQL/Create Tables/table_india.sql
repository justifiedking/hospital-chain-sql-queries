-- Table structure for customer data (example: Table_India)
CREATE TABLE Table_India (
    customer_name VARCHAR(255) NOT NULL,
    customer_id VARCHAR(18) NOT NULL,
    open_date DATE NOT NULL,
    last_consulted_date DATE,
    vaccination_id CHAR(5),
    doctor_name VARCHAR(255),
    state CHAR(5),
    country CHAR(5),
    post_code INT,
    dob DATE,
    is_active CHAR(1),
    age INT, -- Derived column
    days_since_last_consulted INT, -- Derived column
    PRIMARY KEY (customer_id)
);

-- Repeat for other country-specific tables

