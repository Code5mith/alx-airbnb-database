EXPLAIN
SELECT * FROM Booking b, "User" u , Property p, Payment p2 WHERE b.user_id = u.user_id AND p.property_id = b.property_id  AND p2.booking_id = b.booking_id;

EXPLAIN
SELECT
    b.*,
    u.*,
    pr.*,
    p.amount,
    p.payment_date
FROM
    Booking b
INNER JOIN
    "User" u ON b.user_id = u.user_id
INNER JOIN
    Property pr ON b.property_id = pr.property_id
LEFT JOIN
    Payment p ON b.booking_id = p.booking_id;