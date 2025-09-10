# Database Performance Monitoring – Airbnb Database

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Monitoring Tools
- **EXPLAIN / EXPLAIN ANALYZE** → Shows how PostgreSQL executes queries, including sequential scans, index usage, and join strategies.
- **SHOW PROFILE** (MySQL) → Displays resource usage (CPU, memory, I/O) for query execution.
- **pg_stat_activity** (PostgreSQL) → Monitors currently running queries.

---

## Queries Monitored and Results

### 1. Bookings by User
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;
