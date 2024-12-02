### Step 1: Write the Initial Query
Save the following query in `performance.sql`.

```sql
-- Initial query to retrieve bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON pay.booking_id = b.booking_id;
```

---

### Step 2: Analyze the Query’s Performance
Run the query with `EXPLAIN` to analyze its execution plan:

```sql
EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON pay.booking_id = b.booking_id;
```

**Potential inefficiencies to look for:**
- Table scans instead of index scans.
- Large intermediate datasets due to unnecessary columns or joins.
- Excessive memory or temporary table usage.

---

### Step 3: Refactor the Query
#### Optimize with Indexes
Ensure indexes exist on commonly used columns:
- `Booking.user_id`
- `Booking.property_id`
- `Payment.booking_id`

```sql
-- Index creation (if not already done)
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

#### Reduce Unnecessary Joins
- If specific fields are not needed, remove the join with the corresponding table.
- Example: If payment details are unnecessary, skip joining the `Payment` table.

#### Simplify Query
If only specific fields are needed, avoid fetching all columns.

Refactored query:

```sql
-- Refactored query for improved performance
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON pay.booking_id = b.booking_id;
```

---

### Step 4: Analyze Refactored Query Performance
Run the `EXPLAIN` on the refactored query:

```sql
EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON pay.booking_id = b.booking_id;
```

---

### Step 5: Document Results
Compare performance metrics before and after refactoring. For example:

| Metric             | Initial Query   | Refactored Query |
|---------------------|-----------------|------------------|
| Execution Time      | High (e.g., 1s) | Low (e.g., 0.3s) |
| Rows Processed      | Many            | Fewer            |
| Temporary Tables    | Yes             | No               |
| Index Utilization   | Poor            | High             |
