-- ============================================
-- Index Creation for Performance Optimization
-- ============================================

-- 1. Users Table
-- High usage columns: id (primary key), email (login/search), name (search)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(name);

-- 2. Bookings Table
-- High usage columns: user_id (JOIN with users), property_id (JOIN with properties), start_date (filtering, ordering)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 3. Properties Table
-- High usage columns: id (primary key), location (search/filter), price (filter/order)
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

-- ============================================
-- Performance Testing with EXPLAIN/ANALYZE
-- ============================================

-- Example: Before and after indexing
-- Find all bookings for a given user
EXPLAIN ANALYZE
SELECT * 
FROM bookings b
WHERE b.user_id = 5;

-- Example: Before and after indexing
-- Find all properties in a specific location ordered by price
EXPLAIN ANALYZE
SELECT * 
FROM properties p
WHERE p.location = 'New York'
ORDER BY p.price;
