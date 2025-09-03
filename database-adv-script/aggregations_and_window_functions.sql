-- Aggregation
SELECT user_id, COUNT(*) AS total_bookings
	FROM Booking
	GROUP BY user_id
	ORDER BY total_bookings DESC;


-- window function 
WITH PropertyBookingCount AS (
    SELECT property_id, COUNT(booking_id) AS booking_count
    FROM Booking
    GROUP BY property_id
) SELECT -- query must be in the same line 
    property_id,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS property_rank
FROM PropertyBookingCount
ORDER BY property_rank ASC;
