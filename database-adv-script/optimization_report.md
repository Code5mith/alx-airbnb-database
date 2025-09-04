# Optimized Complex Queries Performance Analysis

This document outlines a performance analysis to demonstrate the significant speed improvements # achieved by adding a database optimizing queries. The test compares the execution time of a specific SELECT query on a large dataset before and after the optimisation of DB query. 

# Analysis

## Before Refactoring 

We used a FULL OUTER JOIN query to retrive records from related tables { user , property , booking , pricing } Since the query returns related and also unrelated results output was not optimal containing NULL entries and also adding extra performance overhead.

## After Refactoring

After refactoring our Query, we where able to remove the NULL results and also improve performance by about 0.02 seconds(This is a test database with limited data )

## Conclusion

The results clearly demonstrate that a properly crafted query can improve performance by a difference of magnitude. 