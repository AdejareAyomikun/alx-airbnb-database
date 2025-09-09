# SQL Joins – Airbnb Database

This module demonstrates the use of different SQL JOINs to query the Airbnb database.

## Queries

### 1. INNER JOIN (Bookings and Users)
```sql
SELECT b.id, b.property_id, b.start_date, b.end_date, u.id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
