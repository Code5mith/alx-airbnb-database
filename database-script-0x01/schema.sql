CREATE TABLE IF NOT EXISTS User (
    -- we used text form the id for scalability reasons since we will be using uuid, 
    user_id TEXT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone_number TEXT,
    role TEXT NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TEXT DEFAULT (DATETIME('now'))
);

-- 2. Create the Property table
CREATE TABLE IF NOT EXISTS Property (
    property_id TEXT PRIMARY KEY,
    host_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    location TEXT NOT NULL,
    pricepernight REAL NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now')),
    updated_at TEXT DEFAULT (DATETIME('now')),
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- 3. Create the Booking table
CREATE TABLE IF NOT EXISTS Booking (
    booking_id TEXT PRIMARY KEY,
    property_id TEXT NOT NULL,
    user_id TEXT NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    total_price REAL NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TEXT DEFAULT (DATETIME('now')),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- 4. Create the Payment table
CREATE TABLE IF NOT EXISTS Payment (
    payment_id TEXT PRIMARY KEY,
    booking_id TEXT UNIQUE NOT NULL,
    amount REAL NOT NULL,
    payment_date TEXT DEFAULT (DATETIME('now')),
    payment_method TEXT NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- 5. Create the Review table
CREATE TABLE IF NOT EXISTS Review (
    review_id TEXT PRIMARY KEY,
    property_id TEXT NOT NULL,
    user_id TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now')),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- 6. Create the Message table
CREATE TABLE IF NOT EXISTS Message (
    message_id TEXT PRIMARY KEY,
    sender_id TEXT NOT NULL,
    recipient_id TEXT NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TEXT DEFAULT (DATETIME('now')),
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE SET NULL,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE SET NULL
);