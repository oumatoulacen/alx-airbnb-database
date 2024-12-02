-- Step 1: Create the partitioned Booking table
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025)
);

-- Notes:
-- 1. We are partitioning the Booking table based on the YEAR of the start_date.
-- 2. Each partition holds data for one specific year. For example, p_2020 contains bookings that start in 2020.
-- 3. You can add more partitions as required for future years.

-- Step 2: To test performance, run the following query (before and after partitioning) to retrieve bookings for a specific date range.
-- Example query for fetching bookings between two specific years:
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';
