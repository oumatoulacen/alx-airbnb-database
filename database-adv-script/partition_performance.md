# Performance Report on Partitioning the Booking Table

## Objective
The objective was to implement table partitioning on the `Booking` table based on the `start_date` column and assess any performance improvements in querying by date range.

## Partitioning Implementation
We used MySQL's `RANGE` partitioning on the `start_date` column, which is based on the year of the date. The table was partitioned into five partitions, each representing one year from 2020 to 2024.

```sql
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025)
);
