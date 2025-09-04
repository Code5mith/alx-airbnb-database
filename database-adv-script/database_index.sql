-- Create indexes on primary key and foreign key columns for faster joins and lookups.

-- Index for the User table's primary key

-- Before indexing 
EXPLAIN SELECT * FROM "User" u WHERE u."role" == "guest"; ANALYZE

CREATE INDEX idx_user_id ON User (user_id);

-- Index for the Booking table's user_id foreign key
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index for the Booking table's property_id foreign key
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Index for the Property table's primary key
CREATE INDEX idx_property_id ON Property (property_id);

-- Index for the Review table's property_id foreign key
CREATE INDEX idx_review_property_id ON Review (property_id);

-- Add an index on a frequently searched column like the 'location' in the Property table.
CREATE INDEX idx_property_location ON Property (location);

-- After indexing 
EXPLAIN SELECT * FROM "User" u WHERE u."role" == "guest"; ANALYZE