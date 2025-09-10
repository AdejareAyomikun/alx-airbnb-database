# Query Optimization Report – Airbnb Database

## Initial Query
```sql
SELECT b.id, b.start_date, b.end_date,
       u.id, u.name, u.email,
       p.id, p.title, p.location,
       pay.id, pay.amount, pay.status, pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND p.location = 'New York';