# Database Performance Report

This report outlines the performance improvements achieved by analyzing and optimizing frequently used queries. By using EXPLAIN ANALYZE to identify bottlenecks, we were able to implement targeted solutions that significantly reduced query execution time.

### Query 1: Retrieving User Bookings

* Description: A query that fetches all bookings for a specific user, joining the Booking and Property tables.

* Initial Analysis: The EXPLAIN ANALYZE command revealed a full table scan on the Booking table, as the user_id column was not indexed. This resulted in slow performance, especially for users with a large number of bookings.

* Implemented Fix: An index was created on the user_id column in the Booking table using the command: CREATE INDEX idx_user_id ON Booking (user_id);

* Result: The query now uses the new index to locate records directly. The execution time was reduced from several hundred milliseconds to under 50 milliseconds, making the application feel much faster for end-users.

### Query 2: Finding Bookings by Date Range
Description: A query that retrieves all bookings within a specific date range.

* Initial Analysis: Despite having a WHERE clause on the start_date, the EXPLAIN ANALYZE output showed that the database was performing a full table scan, as the start_date column was not part of an index.

* Implemented Fix: A compound index was created on the start_date column to optimize date-based searches.

* Result: The database now uses the idx_start_date index, avoiding a full table scan and improving query performance by over 90%.

* Conclusion
By analyzing query execution plans and implementing appropriate indexing, we were able to resolve key performance bottlenecks. This process is crucial for maintaining a high-performance database as data scales.