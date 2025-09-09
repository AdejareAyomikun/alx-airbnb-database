# Database Indexing – Airbnb Database

This module demonstrates how to create indexes on frequently queried columns to improve database performance.

---

## Why Indexes?
- Indexes speed up data retrieval in large tables.
- They are most useful on columns frequently used in:
  - **WHERE** clauses (e.g., filtering by user, location).
  - **JOIN** conditions (e.g., joining bookings with users or properties).
  - **ORDER BY** clauses (e.g., sorting properties by price).

---

## Indexes Created

### Users Table
- `email` → for fast login and user lookup.  
- `name` → for quick search by user name.

### Bookings Table
- `user_id` → improves JOIN performance with users.  
- `property_id` → improves JOIN performance with properties.  
- `start_date` → speeds up queries filtering or ordering by booking date.

### Properties Table
- `location` → for filtering properties by city/region.  
- `price` → for ordering and filtering by price.

---

## Performance Testing

### Example 1: Find all bookings by a user
```sql
EXPLAIN ANALYZE
SELECT * 
FROM bookings b
WHERE b.user_id = 5;
