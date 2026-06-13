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

DROP TYPE IF EXISTS user_role CASCADE;

DROP TYPE IF EXISTS current_match_status CASCADE;

DROP TYPE IF EXISTS current_payment_status CASCADE;

CREATE TYPE user_role AS enum('FOOTBALL_FAN', 'TICKET_MANAGER', 'UNKNOWN');

CREATE TYPE current_match_status AS enum('SOLD_OUT', 'AVAILABLE', 'SELLING_FAST');

CREATE TYPE current_payment_status AS enum(
  'PENDING',
  'CONFIRMED',
  'FAILED',
  'CANCELLED',
  'REFUNDED'
);

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id serial PRIMARY KEY,
  full_name varchar(120) NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  role user_role DEFAULT 'UNKNOWN' NOT NULL,
  phone_number varchar(20)
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id serial PRIMARY KEY,
  fixture varchar(200),
  tournament_category varchar(200) NOT NULL,
  base_ticket_price decimal(10, 2) CHECK (base_ticket_price >= 0.0) NOT NULL,
  match_status current_match_status DEFAULT 'AVAILABLE' NOT NULL
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users (user_id),
  match_id int NOT NULL REFERENCES matches (match_id),
  seat_number varchar(10),
  payment_status current_payment_status DEFAULT NULL,
  total_cost decimal(10, 2) CHECK (total_cost >= 0.0)
);

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO
  Users (full_name, email, role, phone_number)
VALUES
  -- Ticket Managers (5%)
  (
    'Jonathan Miller',
    'jonathan.miller@mail.com',
    'TICKET_MANAGER',
    '+8801710000001'
  ),
  (
    'Michael Carter',
    'michael.carter@mail.com',
    'TICKET_MANAGER',
    '+8801710000002'
  ),
  (
    'David Reynolds',
    'david.reynolds@mail.com',
    'TICKET_MANAGER',
    '+8801710000003'
  ),
  (
    'Christopher Haque',
    'christopher.haque@mail.com',
    'TICKET_MANAGER',
    '+8801710000004'
  ),
  (
    'Andrew Thompson',
    'andrew.thompson@mail.com',
    'TICKET_MANAGER',
    '+8801710000005'
  ),
  -- Football Fans (80 users)
  (
    'Jason Walker',
    'jason.walker@mail.com',
    'FOOTBALL_FAN',
    '+8801710000101'
  ),
  (
    'Ethan Brooks',
    'ethan.brooks@mail.com',
    'FOOTBALL_FAN',
    '+8801710000102'
  ),
  (
    'Tanvir Ahmed',
    'tanvirA@mail.com',
    'FOOTBALL_FAN',
    '+8801710000103'
  ),
  (
    'Daniel Cooper',
    'daniel.cooper@mail.com',
    'FOOTBALL_FAN',
    '+8801710000104'
  ),
  (
    'Matthew Turner',
    'matthew.turner@mail.com',
    'FOOTBALL_FAN',
    '+8801710000105'
  ),
  (
    'Joshua Bennett',
    'joshua.bennett@mail.com',
    'FOOTBALL_FAN',
    '+8801710000106'
  ),
  (
    'James Foster',
    'james.foster@mail.com',
    'FOOTBALL_FAN',
    '+8801710000107'
  ),
  (
    'Benjamin Ross',
    'benjamin.ross@mail.com',
    'FOOTBALL_FAN',
    '+8801710000108'
  ),
  (
    'Alexander Reed',
    'alexander.reed@mail.com',
    'FOOTBALL_FAN',
    '+8801710000109'
  ),
  (
    'Samuel Price',
    'samuel.price@mail.com',
    'FOOTBALL_FAN',
    '+8801710000110'
  ),
  (
    'Noah Murphy',
    'noah.murphy@mail.com',
    'FOOTBALL_FAN',
    '+8801710000111'
  ),
  (
    'Liam Hughes',
    'liam.hughes@mail.com',
    'FOOTBALL_FAN',
    '+8801710000112'
  ),
  (
    'Jack Kelly',
    'jack.kelly@mail.com',
    'FOOTBALL_FAN',
    '+8801710000113'
  ),
  (
    'Oliver Ward',
    'oliver.ward@mail.com',
    'FOOTBALL_FAN',
    '+8801710000114'
  ),
  (
    'Henry Cox',
    'henry.cox@mail.com',
    'FOOTBALL_FAN',
    '+8801710000115'
  ),
  (
    'Lucas James',
    'lucas.james@mail.com',
    'FOOTBALL_FAN',
    '+8801710000116'
  ),
  (
    'Elijah Scott',
    'elijah.scott@mail.com',
    'FOOTBALL_FAN',
    '+8801710000117'
  ),
  (
    'Ahmed Reza',
    'areza@mail.com',
    'FOOTBALL_FAN',
    '+8801710000118'
  ),
  (
    'Logan Baker',
    'logan.baker@mail.com',
    'FOOTBALL_FAN',
    '+8801710000119'
  ),
  (
    'Sebastian Adams',
    'sebastian.adams@mail.com',
    'FOOTBALL_FAN',
    '+8801710000120'
  ),
  (
    'George Hill',
    'george.hill@mail.com',
    'FOOTBALL_FAN',
    '+8801710000121'
  ),
  (
    'Edward Clark',
    'edward.clark@mail.com',
    'FOOTBALL_FAN',
    '+8801710000122'
  ),
  (
    'Thomas Lewis',
    'thomas.lewis@mail.com',
    'FOOTBALL_FAN',
    '+8801710000123'
  ),
  (
    'Nathan Allen',
    'nathan.allen@mail.com',
    'FOOTBALL_FAN',
    '+8801710000124'
  ),
  (
    'Caleb Young',
    'caleb.young@mail.com',
    'FOOTBALL_FAN',
    '+8801710000125'
  ),
  (
    'Isaac King',
    'isaac.king@mail.com',
    'FOOTBALL_FAN',
    '+8801710000126'
  ),
  (
    'Aaron Wright',
    'aaron.wright@mail.com',
    'FOOTBALL_FAN',
    '+8801710000127'
  ),
  (
    'Tanvir Tareq',
    'tareqt@mail.com',
    'FOOTBALL_FAN',
    '+8801710000128'
  ),
  (
    'Connor Hall',
    'connor.hall@mail.com',
    'FOOTBALL_FAN',
    '+8801710000129'
  ),
  (
    'Adam Carter',
    'adam.carter@mail.com',
    'FOOTBALL_FAN',
    '+8801710000130'
  ),
  (
    'Brian Murphy',
    'brian.murphy@mail.com',
    'FOOTBALL_FAN',
    '+8801710000131'
  ),
  (
    'Eric Rogers',
    'eric.rogers@mail.com',
    'FOOTBALL_FAN',
    '+8801710000132'
  ),
  (
    'Kyle Morgan',
    'kyle.morgan@mail.com',
    'FOOTBALL_FAN',
    '+8801710000133'
  ),
  (
    'Jordan Perry',
    'jordan.perry@mail.com',
    'FOOTBALL_FAN',
    '+8801710000134'
  ),
  (
    'Justin Howard',
    'justin.howard@mail.com',
    'FOOTBALL_FAN',
    '+8801710000135'
  ),
  (
    'Tyler Cox',
    'tyler.cox@mail.com',
    'FOOTBALL_FAN',
    '+8801710000136'
  ),
  (
    'Brandon Ward',
    'brandon.ward@mail.com',
    'FOOTBALL_FAN',
    '+8801710000137'
  ),
  (
    'Kevin Bennett',
    'kevin.bennett@mail.com',
    'FOOTBALL_FAN',
    '+8801710000138'
  ),
  (
    'Mark Foster',
    'mark.foster@mail.com',
    'FOOTBALL_FAN',
    '+8801710000139'
  ),
  (
    'Paul Reed',
    'paul.reed@mail.com',
    'FOOTBALL_FAN',
    '+8801710000140'
  ),
  (
    'Scott Mitchell',
    'scott.mitchell@mail.com',
    'FOOTBALL_FAN',
    '+8801710000141'
  ),
  (
    'Sean Brooks',
    'sean.brooks@mail.com',
    'FOOTBALL_FAN',
    '+8801710000142'
  ),
  (
    'Greg Anderson',
    'greg.anderson@mail.com',
    'FOOTBALL_FAN',
    '+8801710000143'
  ),
  (
    'Harry Collins',
    'harry.collins@mail.com',
    'FOOTBALL_FAN',
    '+8801710000144'
  ),
  (
    'Owen Stewart',
    'owen.stewart@mail.com',
    'FOOTBALL_FAN',
    '+8801710000145'
  ),
  (
    'Evan Morris',
    'evan.morris@mail.com',
    'FOOTBALL_FAN',
    '+8801710000146'
  ),
  (
    'Ian Rogers',
    'ian.rogers@mail.com',
    'FOOTBALL_FAN',
    '+8801710000147'
  ),
  (
    'Patrick Murphy',
    'patrick.murphy@mail.com',
    'FOOTBALL_FAN',
    '+8801710000148'
  ),
  (
    'Cameron Bell',
    'cameron.bell@mail.com',
    'FOOTBALL_FAN',
    '+8801710000149'
  ),
  (
    'Dylan Ward',
    'dylan.ward@mail.com',
    'FOOTBALL_FAN',
    '+8801710000150'
  ),
  (
    'Ryan Foster',
    'ryan.foster@mail.com',
    'FOOTBALL_FAN',
    '+8801710000151'
  ),
  (
    'Ethan Carter',
    'ethan.carter@mail.com',
    'FOOTBALL_FAN',
    '+8801710000152'
  ),
  (
    'Noah Bennett',
    'noah.bennett@mail.com',
    'FOOTBALL_FAN',
    '+8801710000153'
  ),
  (
    'Liam Brooks',
    'liam.brooks@mail.com',
    'FOOTBALL_FAN',
    '+8801710000154'
  ),
  (
    'James Walker',
    'james.walker@mail.com',
    'FOOTBALL_FAN',
    '+8801710000155'
  ),
  (
    'Benjamin Scott',
    'benjamin.scott@mail.com',
    'FOOTBALL_FAN',
    '+8801710000156'
  ),
  (
    'Lucas Reed',
    'lucas.reed@mail.com',
    'FOOTBALL_FAN',
    '+8801710000157'
  ),
  (
    'Henry Adams',
    'henry.adams@mail.com',
    'FOOTBALL_FAN',
    '+8801710000158'
  ),
  (
    'Alexander King',
    'alexander.king@mail.com',
    'FOOTBALL_FAN',
    '+8801710000159'
  ),
  (
    'Matthew Hill',
    'matthew.hill@mail.com',
    'FOOTBALL_FAN',
    '+8801710000160'
  ),
  (
    'Joshua Allen',
    'joshua.allen@mail.com',
    'FOOTBALL_FAN',
    '+8801710000161'
  ),
  (
    'Daniel Young',
    'daniel.young@mail.com',
    'FOOTBALL_FAN',
    '+8801710000162'
  ),
  (
    'Jack Lewis',
    'jack.lewis@mail.com',
    'FOOTBALL_FAN',
    '+8801710000163'
  ),
  (
    'Samuel Clark',
    'samuel.clark@mail.com',
    'FOOTBALL_FAN',
    '+8801710000164'
  ),
  (
    'Elijah Morgan',
    'elijah.morgan@mail.com',
    'FOOTBALL_FAN',
    '+8801710000165'
  ),
  (
    'Aiden James',
    'aiden.james@mail.com',
    'FOOTBALL_FAN',
    '+8801710000166'
  ),
  (
    'Logan Wright',
    'logan.wright@mail.com',
    'FOOTBALL_FAN',
    '+8801710000167'
  ),
  (
    'Sebastian Murphy',
    'sebastian.murphy@mail.com',
    'FOOTBALL_FAN',
    '+8801710000168'
  ),
  (
    'George Cox',
    'george.cox@mail.com',
    'FOOTBALL_FAN',
    '+8801710000169'
  ),
  (
    'Edward Perry',
    'edward.perry@mail.com',
    'FOOTBALL_FAN',
    '+8801710000170'
  ),
  (
    'Thomas Howard',
    'thomas.howard@mail.com',
    'FOOTBALL_FAN',
    '+8801710000171'
  ),
  (
    'Nathan Hall',
    'nathan.hall@mail.com',
    'FOOTBALL_FAN',
    '+8801710000172'
  ),
  (
    'Caleb Cox',
    'caleb.cox@mail.com',
    'FOOTBALL_FAN',
    '+8801710000173'
  ),
  (
    'Isaac Ward',
    'isaac.ward@mail.com',
    'FOOTBALL_FAN',
    '+8801710000174'
  ),
  (
    'Aaron Bell',
    'aaron.bell@mail.com',
    'FOOTBALL_FAN',
    '+8801710000175'
  ),
  (
    'Luke Morgan',
    'luke.morgan@mail.com',
    'FOOTBALL_FAN',
    '+8801710000176'
  ),
  (
    'Connor Baker',
    'connor.baker@mail.com',
    'FOOTBALL_FAN',
    '+8801710000177'
  ),
  (
    'Adam Rogers',
    'adam.rogers@mail.com',
    'FOOTBALL_FAN',
    '+8801710000178'
  ),
  (
    'Brian Perry',
    'brian.perry@mail.com',
    'FOOTBALL_FAN',
    '+8801710000179'
  ),
  (
    'Karim Haque',
    'karim.haque@mail.com',
    'FOOTBALL_FAN',
    '+8801710000180'
  );

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO
  Matches (
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
VALUES
  (
    'Real Madrid vs Barcelona',
    'Champions League',
    150.00,
    'AVAILABLE'
  ),
  (
    'Manchester City vs Liverpool',
    'Premier League',
    120.00,
    'SELLING_FAST'
  ),
  (
    'Bayern Munich vs PSG',
    'Champions League',
    130.00,
    'AVAILABLE'
  ),
  (
    'AC Milan vs Inter Milan',
    'Serie A',
    90.00,
    'SOLD_OUT'
  ),
  ('Juventus vs Roma', 'Serie A', 80.00, 'AVAILABLE'),
  (
    'Arsenal vs Chelsea',
    'Premier League',
    110.00,
    'SELLING_FAST'
  ),
  (
    'Barcelona vs Atletico Madrid',
    'La Liga',
    115.00,
    'AVAILABLE'
  ),
  (
    'Borussia Dortmund vs Bayern Munich',
    'Bundesliga',
    100.00,
    'AVAILABLE'
  ),
  ('PSG vs Marseille', 'Ligue 1', 95.00, 'SOLD_OUT'),
  (
    'Tottenham vs Manchester United',
    'Premier League',
    125.00,
    'AVAILABLE'
  ),
  (
    'Real Madrid vs Sevilla',
    'La Liga',
    105.00,
    'AVAILABLE'
  ),
  (
    'Inter Milan vs Napoli',
    'Serie A',
    85.00,
    'SELLING_FAST'
  ),
  (
    'Bayern Munich vs RB Leipzig',
    'Bundesliga',
    98.00,
    'AVAILABLE'
  ),
  (
    'Chelsea vs Arsenal',
    'Premier League',
    115.00,
    'AVAILABLE'
  ),
  (
    'Barcelona vs Real Betis',
    'La Liga',
    90.00,
    'SOLD_OUT'
  ),
  (
    'Liverpool vs Everton',
    'Premier League',
    100.00,
    'AVAILABLE'
  ),
  ('PSG vs Lyon', 'Ligue 1', 92.00, 'AVAILABLE'),
  (
    'AC Milan vs Lazio',
    'Serie A',
    88.00,
    'SELLING_FAST'
  ),
  (
    'Manchester City vs Newcastle',
    'Premier League',
    118.00,
    'AVAILABLE'
  ),
  (
    'Juventus vs AC Milan',
    'Serie A',
    95.00,
    'AVAILABLE'
  ),
  (
    'Real Madrid vs Atletico Madrid',
    'Champions League',
    155.00,
    'SELLING_FAST'
  ),
  (
    'Bayern Munich vs Dortmund',
    'Bundesliga',
    110.00,
    'AVAILABLE'
  ),
  (
    'Barcelona vs Sevilla',
    'La Liga',
    100.00,
    'AVAILABLE'
  ),
  ('PSG vs Monaco', 'Ligue 1', 90.00, 'SOLD_OUT'),
  (
    'Arsenal vs Tottenham',
    'Premier League',
    130.00,
    'AVAILABLE'
  ),
  (
    'Liverpool vs Chelsea',
    'Premier League',
    125.00,
    'SELLING_FAST'
  ),
  (
    'Inter Milan vs Juventus',
    'Serie A',
    92.00,
    'AVAILABLE'
  ),
  (
    'Real Madrid vs Valencia',
    'La Liga',
    108.00,
    'AVAILABLE'
  ),
  (
    'Bayern Munich vs Frankfurt',
    'Bundesliga',
    97.00,
    'AVAILABLE'
  ),
  (
    'Manchester United vs Arsenal',
    'Premier League',
    140.00,
    'SOLD_OUT'
  ),
  ('PSG vs Lille', 'Ligue 1', 88.00, 'AVAILABLE'),
  (
    'Barcelona vs Real Madrid',
    'Champions League',
    160.00,
    'SELLING_FAST'
  ),
  (
    'AC Milan vs Fiorentina',
    'Serie A',
    84.00,
    'AVAILABLE'
  ),
  (
    'Chelsea vs Man City',
    'Premier League',
    135.00,
    'AVAILABLE'
  ),
  (
    'Sevilla vs Atletico Madrid',
    'La Liga',
    95.00,
    'AVAILABLE'
  ),
  (
    'Bayern Munich vs Leverkusen',
    'Bundesliga',
    99.00,
    'SELLING_FAST'
  ),
  (
    'Liverpool vs Brighton',
    'Premier League',
    102.00,
    'AVAILABLE'
  ),
  ('PSG vs Nice', 'Ligue 1', 89.00, 'AVAILABLE'),
  (
    'Juventus vs Napoli',
    'Serie A',
    93.00,
    'SOLD_OUT'
  ),
  (
    'Barcelona vs Valencia',
    'La Liga',
    101.00,
    'AVAILABLE'
  ),
  (
    'Real Madrid vs Bayern Munich',
    'Champions League',
    170.00,
    'SELLING_FAST'
  ),
  (
    'Manchester City vs Arsenal',
    'Premier League',
    145.00,
    'AVAILABLE'
  ),
  (
    'Inter Milan vs Roma',
    'Serie A',
    90.00,
    'AVAILABLE'
  ),
  ('PSG vs Rennes', 'Ligue 1', 87.00, 'AVAILABLE'),
  (
    'Borussia Dortmund vs Leipzig',
    'Bundesliga',
    96.00,
    'SOLD_OUT'
  ),
  (
    'Liverpool vs Man United',
    'Premier League',
    150.00,
    'SELLING_FAST'
  ),
  (
    'Barcelona vs Bayern Munich',
    'Champions League',
    165.00,
    'AVAILABLE'
  ),
  (
    'AC Milan vs Inter Milan',
    'Serie A',
    100.00,
    'SOLD_OUT'
  ),
  (
    'Real Madrid vs PSG',
    'Champions League',
    175.00,
    'AVAILABLE'
  ),
  (
    'Arsenal vs Liverpool',
    'Premier League',
    135.00,
    'AVAILABLE'
  );

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO
  Bookings (
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
  )
VALUES
  (12, 5, 'A-10', 'CONFIRMED', 150.00),
  (12, 12, 'BB-10', 'CONFIRMED', 230.00),
  (33, 5, 'A-11', 'CONFIRMED', 155.00),
  (47, 18, 'B-04', 'PENDING', 120.00),
  (33, 18, 'A-11', 'CONFIRMED', 115.00),
  (3, 22, NULL, 'FAILED', 130.00),
  (85, 7, 'C-19', 'CONFIRMED', 90.00),
  (29, 41, 'D-02', 'CONFIRMED', 80.00),
  (64, 13, NULL, 'PENDING', 110.00),
  (18, 33, 'E-11', 'CONFIRMED', 115.00),
  (77, 9, 'A-01', 'CANCELLED', 100.00),
  (5, 27, NULL, 'PENDING', 95.00),
  (52, 3, 'B-12', 'CONFIRMED', 125.00),
  (41, 50, 'C-07', 'CONFIRMED', 105.00),
  (9, 16, NULL, 'FAILED', 85.00),
  (60, 44, 'D-09', 'CONFIRMED', 98.00),
  (23, 11, 'A-14', 'CONFIRMED', 115.00),
  (71, 38, NULL, NULL, 90.00),
  (34, 6, 'B-03', 'CONFIRMED', 100.00),
  (2, 21, 'E-18', 'CONFIRMED', 92.00),
  (58, 30, NULL, 'PENDING', 88.00),
  (83, 14, 'C-22', 'CONFIRMED', 118.00),
  (15, 45, 'A-06', 'CANCELLED', 95.00),
  (49, 2, NULL, 'FAILED', 155.00),
  (66, 19, 'D-12', 'CONFIRMED', 110.00),
  (27, 37, 'B-08', 'CONFIRMED', 100.00),
  (80, 8, NULL, 'REFUNDED', 90.00),
  (11, 24, 'E-05', 'CONFIRMED', 130.00),
  (53, 12, 'A-20', 'CONFIRMED', 125.00),
  (6, 29, NULL, 'PENDING', 92.00),
  (39, 46, 'C-15', NULL, 108.00),
  (74, 4, 'B-01', 'CANCELLED', 97.00),
  (21, 31, NULL, 'CONFIRMED', 140.00);

-- ========================================================================================================
-- Part 2: SQL Queries & Expected Sample Output (Open the QUERY.sql file and start your queries from there)
-- =========================================================================================================

-- ======================================================================================
-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' 
-- where the match status is 'Available'.
-- ======================================================================================
SELECT
  match_id,
  fixture,
  base_ticket_price
FROM
  matches
WHERE
  tournament_category = 'Champions League'
  AND match_status = 'AVAILABLE';

-- testing a similar query: SELECT * from matches where tournament_category= 'Champions League' and match_status = 'AVAILABLE';
-- ====================================================================================================================
-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
-- ====================================================================================================================
SELECT
  *
FROM
  users
WHERE
  full_name ILIKE 'Tanvir%'
  OR full_name ILIKE '%Haque%';

-- testing a similar query: SELECT * from users where full_name ilike 'Henry%' or full_name ilike '%Adam%';
-- ===========================================================================================================
-- Query 3: Retrieve all booking records where the payment status is missing (NULL), 
--   replacing the empty result with 'Action Required'.
-- ============================================================================================================
-- initial step: SELECT * from bookings where payment_status is null;
SELECT
  booking_id,
  user_id,
  match_id,
  COALESCE(payment_status::text, 'ACTION REQUIRED') AS systematic_status
FROM
  bookings
WHERE
  payment_status IS NULL;

-- =============================================================================================================
-- Query 4: Retrieve match booking details along with the User's full name and 
-- the scheduled Match fixture teams.
-- =============================================================================================================
SELECT
  b.booking_id,
  u.full_name,
  m.fixture,
  b.total_cost
FROM
  bookings b
  JOIN users u ON b.user_id = u.user_id
  JOIN matches m ON b.match_id = m.match_id;

-- ===============================================================================================================
-- Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have 
-- never bought a ticket are still listed.
-- ===============================================================================================================
SELECT
  u.user_id,
  u.full_name,
  b.booking_id
FROM
  users u
  LEFT JOIN bookings b ON u.user_id = b.user_id
order by
  u.user_id;

-- ===============================================================================================================
-- Query 6: Find all ticket bookings where the total cost is strictly higher than 
-- the average cost of all ticket bookings.
-- ===============================================================================================================
SELECT
  *
from
  bookings b
where
  b.total_cost > (
    select
      avg(bookings.total_cost)
    from
      bookings
  );

-- ================================================================================================================
-- Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, 
-- skipping the absolute highest premium match.
-- ================================================================================================================
SELECT
  *
from
  matches m
order by
  m.base_ticket_price desc
limit
  2
offset
  1;
