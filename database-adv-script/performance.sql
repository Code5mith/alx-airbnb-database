EXPLAIN
SELECT
    *
FROM
    Booking b 
FULL OUTER JOIN
    Payment py ON b.booking_id == py.booking_id 
FULL OUTER JOIN
    Property pr ON b.property_id = pr.property_id 
FULL OUTER JOIN
    "User" u ON b.user_id = u.user_id;


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