-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- Enum current_payment_status {
--   "CONFIRMED"
--   "PENDING"
-- }

-- Enum current_match_status {
--   "SOLD_OUT"
--   "AVAILABLE"
--   "SELLING_FAST"
-- }
DROP TYPE IF EXISTS user_role; 

CREATE TYPE user_role AS ENUM (
  'FOOTBALL_FAN',
  'TICKET_MANAGER',
  'UNKNOWN'
);

CREATE TYPE current_match_status AS ENUM (
  'SOLD_OUT',
  'AVAILABLE'
  'SELLING_FAST'
);


-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(120) not null,
    email varchar(100) unique not null,
    role user_role default 'UNKNOWN',
    phone_number varchar(12)
);


-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(200),
    tournament_category varcharxx`x`(200),
    base_ticket_price decimal(10, 2) check (base_ticket_price > 0.0),
    match_status current_match_status
);
