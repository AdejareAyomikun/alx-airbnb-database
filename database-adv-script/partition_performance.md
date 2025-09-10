# Partitioning Performance Report – Airbnb Database

## Objective
The `bookings` table is large, leading to slow queries when filtering by `start_date`.  
We implemented **table partitioning by year** to improve performance.

---

## Implementation
- Parent table: `bookings` partitioned by **RANGE (start_date)**.  
- Partitions:
  - `bookings_2024` → bookings in 2024  
  - `bookings_2025` → bookings in 2025  
  - `bookings_future` → bookings from 2026 onward  
- Indexes created on `start_date` for each partition.

---

## Performance Test

### Query Tested
```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-05-31';
