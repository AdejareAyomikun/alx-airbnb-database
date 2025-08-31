-- ==============================
-- Insert Users
-- ==============================
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('01', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '08011111111', 'guest'),
  ('02', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '08022222222', 'host'),
  ('03', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '08033333333', 'host'),
  ('04', 'Diana', 'Evans', 'diana@example.com', 'hashed_pw4', '08044444444', 'guest'),
  ('05', 'Admin', 'User', 'admin@example.com', 'hashed_pw5', NULL, 'admin');

-- ==============================
-- Insert Properties
-- ==============================
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('aaaa1111-aaaa-1111-aaaa-111111111111', '22222222-2222-2222-2222-222222222222',
   'Cozy Apartment', 'A modern apartment in Lagos.', 'Lagos, Nigeria', 150.00),
  ('bbbb2222-bbbb-2222-bbbb-222222222222', '33333333-3333-3333-3333-333333333333',
   'Beach House', 'A lovely beach house with ocean view.', 'Cape Town, South Africa', 300.00);

-- ==============================
-- Insert Bookings
-- ==============================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('book1111-book-1111-book-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 600.00, 'confirmed'),
  ('book2222-book-2222-book-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222',
   '44444444-4444-4444-4444-444444444444', '2025-09-10', '2025-09-15', 1500.00, 'pending');

-- ==============================
-- Insert Payments
-- ==============================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay1111-pay1-1111-pay1-111111111111', 'book1111-book-1111-book-111111111111', 600.00, 'credit_card'),
  ('pay2222-pay2-2222-pay2-222222222222', 'book2222-book-2222-book-222222222222', 1500.00, 'paypal');

-- ==============================
-- Insert Reviews
-- ==============================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev1111-rev1-1111-rev1-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111',
   '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay, very clean and well-located!'),
  ('rev2222-rev2-2222-rev2-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222',
   '44444444-4444-4444-4444-444444444444', 4, 'Great view, but the WiFi was a bit slow.');

-- ==============================
-- Insert Messages
-- ==============================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg1111-msg1-1111-msg1-111111111111', '11111111-1111-1111-1111-111111111111',
   '22222222-2222-2222-2222-222222222222', 'Hi Bob, I am interested in booking your apartment.'),
  ('msg2222-msg2-2222-msg2-222222222222', '22222222-2222-2222-2222-222222222222',
   '11111111-1111-1111-1111-111111111111', 'Thanks Alice, your booking has been confirmed!');
