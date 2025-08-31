# Database Seed – Airbnb Clone

This folder contains the SQL seed script to populate the Airbnb schema with **sample data**.

---

## 📂 Files
- **seed.sql** – Inserts sample rows into all tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`).
- **README.md** – Documentation and usage instructions.

---

## 🧪 Sample Data Overview
- **Users**: 5 sample accounts (guests, hosts, admin).
- **Properties**: 2 listings (Cozy Apartment in Lagos, Beach House in Cape Town).
- **Bookings**: 2 sample reservations (one confirmed, one pending).
- **Payments**: Linked to bookings.
- **Reviews**: Each booking has an example review.
- **Messages**: Example conversation between a guest and a host.

---

## ▶️ Usage

Make sure you’ve created the schema first (`schema.sql`), then run:

```bash
psql -U your_username -d your_database -f seed.sql
