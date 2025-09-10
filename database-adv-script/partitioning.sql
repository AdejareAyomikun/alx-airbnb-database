-- ============================================
-- Table Partitioning for Bookings
-- ============================================

-- 1. Drop old table if exists (optional for testing)
DROP TABLE IF EXISTS bookings CASCADE;

-- 2. Create the parent table (partitioned by RANGE on start_date)
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions by year
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_future PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2100-01-01');

-- 4. Indexes for each partition (for faster lookups)
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);
CREATE INDEX idx_bookings_future_start_date ON bookings_future(start_date);

-- ============================================
-- Test Query (on partitioned table)
-- ============================================
-- Fetch bookings in 2025
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-05-31';
