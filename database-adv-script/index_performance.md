### Step 1: Identify High-Usage Columns
Based on common operations:
- **`User` Table**:
  - `email`: Frequently used in lookups (e.g., authentication).
  - `user_id`: Used in `JOIN` operations.
- **`Booking` Table**:
  - `booking_id`: Frequently accessed or filtered in queries.
  - `user_id`: Used to associate bookings with users.
  - `property_id`: Used in `JOIN` with the `Property` table.
- **`Property` Table**:
  - `property_id`: Frequently accessed or filtered in queries.
  - `location`: Used in queries for property searches.

---

### Step 2: Write `CREATE INDEX` Commands
Save the following commands to a file named `database_index.sql`.

```sql
-- Indexes for the User table
CREATE INDEX idx_user_email ON User(email); -- Optimizes lookups by email
CREATE INDEX idx_user_id ON User(user_id);  -- Optimizes joins on user_id

-- Indexes for the Booking table
CREATE INDEX idx_booking_id ON Booking(booking_id);        -- Optimizes queries by booking_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);      -- Optimizes joins with User table
CREATE INDEX idx_booking_property_id ON Booking(property_id); -- Optimizes joins with Property table

-- Indexes for the Property table
CREATE INDEX idx_property_id ON Property(property_id);      -- Optimizes queries by property_id
CREATE INDEX idx_property_location ON Property(location);   -- Optimizes searches by location
```

---

### Step 3: Measure Performance with `EXPLAIN` or `ANALYZE`
To assess the performance impact of adding indexes:

1. **Before Adding Indexes**:
   Run `EXPLAIN` or `ANALYZE` on queries to understand the execution plan.

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 'some-user-id';
EXPLAIN SELECT * FROM Property WHERE location = 'New York';
```

2. **Add Indexes**:
   Execute the `CREATE INDEX` commands from `database_index.sql`.

3. **After Adding Indexes**:
   Re-run the same queries with `EXPLAIN` or `ANALYZE` and compare execution plans.

---

### Example Performance Comparison
#### Query: Fetch bookings for a specific user
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
```

- **Without Index**:
  - MySQL performs a full table scan.
  - High cost for large datasets.

- **With Index (`idx_booking_user_id`)**:
  - MySQL uses the index to locate rows efficiently.
  - Significant reduction in query execution time.

#### Query: Search properties by location
```sql
EXPLAIN SELECT * FROM Property WHERE location = 'New York';
```

- **Without Index**:
  - Full table scan for `location`.
- **With Index (`idx_property_location`)**:
  - MySQL uses the index to quickly find relevant rows.

---

### Step 4: Save Analysis Results
Document the `EXPLAIN` output before and after adding indexes to validate improvements. For example:

| Query                              | Before Index | After Index |
|------------------------------------|--------------|-------------|
| `SELECT * FROM Booking WHERE user_id = ...` | Full Table Scan | Index Scan |
| `SELECT * FROM Property WHERE location = ...` | Full Table Scan | Index Scan |
