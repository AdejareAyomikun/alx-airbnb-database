# Database Normalization – Airbnb Schema

This document explains how the Airbnb database schema has been normalized to **Third Normal Form (3NF)**.

---

## Step 1: First Normal Form (1NF)
- All tables have atomic values (no repeating groups or arrays).
- Example: The `User` table has a single `phone_number` field instead of multiple phone columns.
- ✅ The schema is in 1NF.

---

## Step 2: Second Normal Form (2NF)
- Each table has a single-column primary key (`UUID`).
- No non-key attributes depend on only part of a key.
- ✅ The schema is in 2NF.

---

## Step 3: Third Normal Form (3NF)
- Checked for **transitive dependencies** (non-key attributes depending on other non-key attributes).
- Findings:
  - **User:** All attributes depend only on `user_id`.
  - **Property:** All attributes depend only on `property_id`.
  - **Booking:** All attributes depend only on `booking_id`.
    - ⚠️ The `total_price` can be derived from `(end_date - start_date) * price_per_night`.  
      - In strict 3NF, this field should be removed.  
      - In practice, it is kept for performance and historical pricing reasons.
  - **Payment, Review, Message:** All attributes depend only on their respective primary keys.
- ✅ The schema is in 3NF, with one noted denormalization (`Booking.total_price`).

---

## Conclusion
The Airbnb database design is in **Third Normal Form (3NF)**.  
- All tables satisfy 1NF and 2NF.  
- There are no transitive dependencies except for the intentional denormalization of `Booking.total_price`.  
- This ensures reduced redundancy and improved data integrity while balancing performance considerations.
