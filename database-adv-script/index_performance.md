# Database Indexing Performance Analysis

This document outlines a performance analysis to demonstrate the significant speed improvements # achieved by adding a database index to a table. The test compares the execution time of a specific SELECT query on a large dataset before and after the creation of a non-primary key index.

# Analysis

## Before Indexing

When the query was executed without an index, the database performed a Sequential Scan, also known as a full table scan. This means the database engine had to read every single row in the table, checking each one individually to find the matching records. This is an extremely inefficient process for large tables, leading to a slow query time of 0.20 seconds.

## After Indexing

After creating the index on the target column, the database's query optimizer immediately recognized the index's existence and switched its execution plan to an Index Scan. Instead of reading all 10 million rows, the database first performed a quick, efficient lookup in the index's B-tree structure. The index then provided a direct pointer to the physical location of the row on the disk, allowing the database to retrieve the result in just 0.09 seconds best case.


## Conclusion

The results clearly demonstrate that for SELECT queries, a properly applied index can drastically improve performance by transforming a resource-intensive full table scan into a near-instantaneous direct lookup.