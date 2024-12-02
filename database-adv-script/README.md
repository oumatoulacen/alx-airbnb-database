# Master SQL joins by writing complex queries using different types of joins.

## Explanation of the Queries
1. **INNER JOIN**: Includes only the rows where there is a match in both tables.
2. **LEFT JOIN**: Includes all rows from the left table (Property) and only matching rows from the right table (Review).
3. **FULL OUTER JOIN**: Combines results of `LEFT JOIN` and `RIGHT JOIN` to include all rows from both tables, filling unmatched rows with `NULL`.


### 1. **INNER JOIN**: Retrieve all bookings and the respective users who made those bookings.
This query retrieves details of bookings along with user information, showing only those bookings where a user exists.

### 2. **LEFT JOIN**: Retrieve all properties and their reviews, including properties that have no reviews.
This query retrieves all properties and their corresponding reviews. If a property has no reviews, it still appears in the result with `NULL` values for review-related columns.


### 3. **FULL OUTER JOIN**: Retrieve all users and all bookings, even if the user or booking is not linked.
MySQL does not support `FULL OUTER JOIN` directly. Instead, you can use a combination of `LEFT JOIN` and `RIGHT JOIN` with `UNION` to achieve this.
