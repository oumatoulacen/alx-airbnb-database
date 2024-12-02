# Performance Monitoring and Improvements

## Objective
Monitor and optimize the performance of frequently used queries on the database.

## Steps Taken
1. **Identified Bottlenecks**:
   - Using `EXPLAIN ANALYZE`, I identified that the query to retrieve bookings by user was performing poorly due to full table scans and missing indexes.
   - The query was performing unnecessary file sorts, which slowed down execution.

2. **Schema Adjustments**:
   - Added the following indexes to improve query performance:
     ```sql
     CREATE INDEX idx_user_id ON Booking(user_id);
     CREATE INDEX idx_booking_id ON Payment(booking_id);
     ```
   - After adding indexes, the query execution time improved significantly, as MySQL no longer needed to scan entire tables.

3. **Partitioning (If applicable)**:
   - If the `Booking` table is large and filtering by `start_date` is common, we considered partitioning the table by year, improving the efficiency of range queries.

## Observations
After applying the changes, the query execution time decreased by X%. This was mainly due to:
- The use of appropriate indexes.
- Reduced table scans.
- No unnecessary temporary tables or file sorts.

## Conclusion
By continuously monitoring query performance with `EXPLAIN ANALYZE`, we were able to identify bottlenecks and optimize queries by adding indexes and adjusting the schema. This resulted in significant performance improvements, especially for large datasets.
