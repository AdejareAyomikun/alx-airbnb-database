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
