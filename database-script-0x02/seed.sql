-- 1. Insert two users: a host and a guest.
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role, created_at)
VALUES
('0e4d94c9-8d76-47b6-944a-1a84f509c162', 'Jane', 'Doe', 'jane.doe@example.com', 'hashed_password_1', 'host', DATETIME('now')),
('7e1f48d7-5d21-4f9e-a034-7c3a4f65c197', 'John', 'Smith', 'john.smith@example.com', 'hashed_password_2', 'guest', DATETIME('now'));

-- 2. Insert one property owned by the host.
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('b301c402-990a-427f-94a0-54f38e0a1b82', '0e4d94c9-8d76-47b6-944a-1a84f509c162', 'Cozy Downtown Loft', 'A beautiful loft in the heart of the city.', 'New York City', 150.00, DATETIME('now'), DATETIME('now'));

-- 3. Insert one booking for the property by the guest.
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('2d4e8c15-f623-4c9f-b7a4-3e91d5a7b6c5', 'b301c402-990a-427f-94a0-54f38e0a1b82', '7e1f48d7-5d21-4f9e-a034-7c3a4f65c197', '2025-09-10', '2025-09-15', 750.00, 'confirmed', DATETIME('now'));

-- 4. Insert one payment for the booking.
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('e9b5f458-9c10-4c3e-b8a2-2c091f7a4b2d', '2d4e8c15-f623-4c9f-b7a4-3e91d5a7b6c5', 750.00, DATETIME('now'), 'credit_card');

-- 5. Insert one review for the property from the guest.
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('f8f1c34a-9e11-4b72-8d5f-4a6c8e0d1b3f', 'b301c402-990a-427f-94a0-54f38e0a1b82', '7e1f48d7-5d21-4f9e-a034-7c3a4f65c197', 5, 'Absolutely loved the place! Very clean and in a great location.', DATETIME('now'));

-- 6. Insert one message from the guest to the host.
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('a7a3e1b9-2c5d-4f73-9a8b-1e5f8a2b0c1d', '7e1f48d7-5d21-4f9e-a034-7c3a4f65c197', '0e4d94c9-8d76-47b6-944a-1a84f509c162', 'Hello, looking forward to my stay next week!', DATETIME('now'));
