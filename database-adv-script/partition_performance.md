# Partitioned Table Performance Analysis

This document outlines a performance analysis to demonstrate the significant speed improvements achieved by adding a database optimizing queries. The test compares the execution time of a specific SELECT query on a large dataset before and after Partitioning Booking table. 

# Analysis

## Before Refactoring 

Accessing booking data in a specific data range required to go through the whole table adding unecessory performance overhead 

## After Refactoring

Partitioning the new table made the query significantly more efficient and also faster to perform 

## Conclusion

Partitioning a large dataset like Booking that requires the frequent access for a range of data is critical.