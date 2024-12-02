-- Insert Sample Data into User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('111e4567-e89b-12d3-a456-426614174000', 'John', 'Doe', 'john.doe@example.com', 'hashedpassword123', '1234567890', 'guest', DEFAULT),
    ('222e4567-e89b-12d3-a456-426614174001', 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword456', '0987654321', 'host', DEFAULT),
    ('333e4567-e89b-12d3-a456-426614174002', 'Alice', 'Brown', 'alice.brown@example.com', 'hashedpassword789', NULL, 'admin', DEFAULT);

-- Insert Sample Data into Property Table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
    ('444e4567-e89b-12d3-a456-426614174003', '222e4567-e89b-12d3-a456-426614174001', 'Seaside Villa', 'A luxurious villa by the sea.', 'Miami, FL', 250.00, DEFAULT, DEFAULT),
    ('555e4567-e89b-12d3-a456-426614174004', '222e4567-e89b-12d3-a456-426614174001', 'Mountain Cabin', 'A cozy cabin in the mountains.', 'Aspen, CO', 180.00, DEFAULT, DEFAULT);

-- Insert Sample Data into Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('666e4567-e89b-12d3-a456-426614174005', '444e4567-e89b-12d3-a456-426614174003', '111e4567-e89b-12d3-a456-426614174000', '2024-12-10', '2024-12-15', 1250.00, 'confirmed', DEFAULT),
    ('777e4567-e89b-12d3-a456-426614174006', '555e4567-e89b-12d3-a456-426614174004', '111e4567-e89b-12d3-a456-426614174000', '2024-12-20', '2024-12-22', 360.00, 'pending', DEFAULT);

-- Insert Sample Data into Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('888e4567-e89b-12d3-a456-426614174007', '666e4567-e89b-12d3-a456-426614174005', 1250.00, DEFAULT, 'credit_card'),
    ('999e4567-e89b-12d3-a456-426614174008', '777e4567-e89b-12d3-a456-426614174006', 360.00, DEFAULT, 'paypal');

-- Insert Sample Data into Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('aaa44567-e89b-12d3-a456-426614174009', '444e4567-e89b-12d3-a456-426614174003', '111e4567-e89b-12d3-a456-426614174000', 5, 'Amazing place! Highly recommended.', DEFAULT),
    ('bbb44567-e89b-12d3-a456-426614174010', '555e4567-e89b-12d3-a456-426614174004', '111e4567-e89b-12d3-a456-426614174000', 4, 'Beautiful and peaceful.', DEFAULT);

-- Insert Sample Data into Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('ccc44567-e89b-12d3-a456-426614174011', '111e4567-e89b-12d3-a456-426614174000', '222e4567-e89b-12d3-a456-426614174001', 'Hello, I am interested in booking your villa.', DEFAULT),
    ('ddd44567-e89b-12d3-a456-426614174012', '222e4567-e89b-12d3-a456-426614174001', '111e4567-e89b-12d3-a456-426614174000', 'Thank you! The villa is available during your selected dates.', DEFAULT);
