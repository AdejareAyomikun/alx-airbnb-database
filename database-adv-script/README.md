# SQL Joins – Airbnb Database

This module demonstrates the use of different SQL JOINs to query the Airbnb database.

## Queries

### 1. INNER JOIN (Bookings and Users)
```sql
SELECT b.id, b.property_id, b.start_date, b.end_date, u.id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;


# SQL Subqueries – Airbnb Database

This module demonstrates the use of correlated and non-correlated subqueries.

---

## 1. Non-Correlated Subquery (Properties with High Ratings)

```sql
SELECT p.id, p.title, p.location
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


# SQL Aggregation and Window Functions – Airbnb Database

This module demonstrates how to use aggregation (`COUNT`, `GROUP BY`) and window functions (`ROW_NUMBER`, `RANK`) to analyze Airbnb database data.

---

## 1. Aggregation: Count of Bookings per User

```sql
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;


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