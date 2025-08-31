# Database Schema – Airbnb Clone

This folder contains the SQL scripts for defining the **Airbnb database schema**.

---

## 📂 Files
- **schema.sql** – Defines all tables, keys, constraints, and indexes.
- **README.md** – Documentation and usage instructions.

---

## 🏗️ Entities
1. **User**
   - Stores guest, host, and admin accounts.
2. **Property**
   - Represents rental listings created by hosts.
3. **Booking**
   - Links guests to properties with reservation details.
4. **Payment**
   - Stores payments linked to bookings.
5. **Review**
   - Guests can leave reviews for properties they booked.
6. **Message**
   - Enables user-to-user messaging.

---

## ⚖️ Constraints & Indexing
- **Primary Keys:** All tables use `UUID`.
- **Foreign Keys:** Ensure relationships between entities (e.g., `Booking → User`).
- **Checks:**  
  - `User.role ∈ {guest, host, admin}`  
  - `Booking.status ∈ {pending, confirmed, canceled}`  
  - `Payment.payment_method ∈ {credit_card, paypal, stripe}`  
  - `Review.rating ∈ [1–5]`
- **Indexes:**  
  - `User.email`  
  - `Property.host_id`  
  - `Booking.property_id`, `Booking.user_id`  
  - `Payment.booking_id`  
  - `Review.property_id`, `Review.user_id`  
  - `Message.sender_id`, `Message.recipient_id`

---

## ▶️ Usage
Run the script to create the schema:

```bash
psql -U your_username -d your_database -f schema.sql
