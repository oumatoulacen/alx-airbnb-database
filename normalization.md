# Normalization to 3NF

## Objective
Ensure that the database schema adheres to the Third Normal Form (3NF) by eliminating redundancies and ensuring all attributes are functionally dependent only on primary keys.

## Steps Taken

### 1. Analyzing Tables
- **User Table**: No redundancy or transitive dependencies detected.
- **Property Table**: Attributes are atomic and only dependent on the primary key.
- **Booking Table**: No violations of normalization; all attributes are directly related to the primary key.
- **Payment Table**: All fields are atomic and dependent on the primary key.
- **Review Table**: No transitive or partial dependencies; attributes depend solely on the primary key.
- **Message Table**: All attributes depend only on the primary key.

### 2. Verification
Each table was examined for:
- Atomicity: All attributes are atomic and cannot be further divided.
- Functional Dependency: All non-primary attributes depend directly on the primary key.
- Transitive Dependency: No attribute depends on another non-primary attribute.

### 3. Conclusion
The provided schema is in **Third Normal Form (3NF)**, requiring no structural changes.
