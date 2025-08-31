# Entity Relationship Diagram (ERD) – Airbnb Database

This document describes the database schema for the **ALX Airbnb Database** project. It defines the entities, their attributes, relationships, and constraints.

---

## Entities and Attributes

### 1. User
- **user_id**: UUID, Primary Key, Indexed  
- **first_name**: VARCHAR, NOT NULL  
- **last_name**: VARCHAR, NOT NULL  
- **email**: VARCHAR, UNIQUE, NOT NULL  
- **password_hash**: VARCHAR, NOT NULL  
- **phone_number**: VARCHAR, NULL  
- **role**: ENUM (`guest`, `host`, `admin`), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 2. Property
- **property_id**: UUID, Primary Key, Indexed  
- **host_id**: Foreign Key → User(user_id)  
- **name**: VARCHAR, NOT NULL  
- **description**: TEXT, NOT NULL  
- **location**: VARCHAR, NOT NULL  
- **price_per_night**: DECIMAL, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### 3. Booking
- **booking_id**: UUID, Primary Key, Indexed  
- **property_id**: Foreign Key → Property(property_id)  
- **user_id**: Foreign Key → User(user_id)  
- **start_date**: DATE, NOT NULL  
- **end_date**: DATE, NOT NULL  
- **total_price**: DECIMAL, NOT NULL  
- **status**: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 4. Payment
- **payment_id**: UUID, Primary Key, Indexed  
- **booking_id**: Foreign Key → Booking(booking_id)  
- **amount**: DECIMAL, NOT NULL  
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **payment_method**: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL  

### 5. Review
- **review_id**: UUID, Primary Key, Indexed  
- **property_id**: Foreign Key → Property(property_id)  
- **user_id**: Foreign Key → User(user_id)  
- **rating**: INTEGER, CHECK (1 ≤ rating ≤ 5), NOT NULL  
- **comment**: TEXT, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 6. Message
- **message_id**: UUID, Primary Key, Indexed  
- **sender_id**: Foreign Key → User(user_id)  
- **recipient_id**: Foreign Key → User(user_id)  
- **message_body**: TEXT, NOT NULL  
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

## Relationships

- **User → Property**: One host (User) can own many Properties. *(1 : N)*  
- **User → Booking**: One guest (User) can make many Bookings. *(1 : N)*  
- **Property → Booking**: One Property can be booked multiple times. *(1 : N)*  
- **Booking → Payment**: Each Booking has one Payment. *(1 : 1)*  
- **Booking → Review**: A Booking can have one Review. *(1 : 1)*  
- **User → Message**: Users can send and receive many Messages. *(M : M, resolved via sender_id and recipient_id)*  

---

## Constraints

- **User Table**  
  - Unique constraint on `email`.  
  - Non-null constraints on required fields.  

- **Property Table**  
  - Foreign key constraint on `host_id`.  
  - Non-null constraints on essential attributes.  

- **Booking Table**  
  - Foreign key constraints on `property_id` and `user_id`.  
  - `status` restricted to `pending`, `confirmed`, or `canceled`.  

- **Payment Table**  
  - Foreign key constraint on `booking_id`.  

- **Review Table**  
  - `rating` must be between 1 and 5.  
  - Foreign key constraints on `property_id` and `user_id`.  

- **Message Table**  
  - Foreign key constraints on `sender_id` and `recipient_id`.  

---

## Indexing

- **Primary Keys**: Automatically indexed.  
- **Additional Indexes**:  
  - `email` in **User**  
  - `property_id` in **Property** and **Booking**  
  - `booking_id` in **Booking** and **Payment**  

---

## ER Diagram

The ERD visually represents the relationships:

https://drive.google.com/file/d/1-exwfweG2pUKspF-JoYmmKeTVIHTCxQQ/view?usp=sharing