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


EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';
EXPLAIN SELECT * FROM Property WHERE location = 'New York';