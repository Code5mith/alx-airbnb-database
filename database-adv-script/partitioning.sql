CREATE TABLE Booking_Partitioned (
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
) PARTITION BY RANGE (TO_DAYS(start_date)) (
    PARTITION p2024_01 VALUES LESS THAN (TO_DAYS('2025-10-02')),
    PARTITION p2024_02 VALUES LESS THAN (TO_DAYS('2025-11-05'))
);

INSERT INTO `Review_Partitioned` (`review_id`, `booking_id`, `rating`, `comments`, `review_date`)
SELECT * FROM `Review`;


SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-10-01' AND '2025-10-05';
