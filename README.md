# nextLevelAssignment03Hamid

## Brief Description:

In this work, we practice on several core backend skills: creating ER-Diagrams using various tools, defining schemas and tables (with data), and running queries (sql).

## Part 01: Entity-Relationship Diagram (ERD) Design:

- https://dbdiagram.io/d/hamidNextLevelB7A3Solution-6a2d53299340ecc0658daea6

## Part 02: SQL Queries & Expected Sample Output:

- [View SQL Query](./QUERY.sql)

```sql

-- query 01:

SELECT
	match_id,
	fixture,
	base_ticket_price
FROM
	matches
WHERE
	tournament_category = 'Champions League'
	AND match_status = 'AVAILABLE';

-- Sample Outcome:
-------------------------------------------------------------
| match_id | fixture                    | base_ticket_price |
| -------- | -------------------------- | ----------------- |
| 1        | Real Madrid vs Barcelona   | 150.00            |
| 3        | Bayern Munich vs PSG       | 130.00            |
| 47       | Barcelona vs Bayern Munich | 165.00            |
| 49       | Real Madrid vs PSG         | 175.00            |
-------------------------------------------------------------

-- Query 02

SELECT
	*
FROM
	users
WHERE
	full_name ILIKE 'Tanvir%'
	OR full_name ILIKE '%Haque%';


-- Sample Outcome:

| user_id | full_name         | email                      | role           | phone_number   |
| ------- | ----------------- | -------------------------- | -------------- | -------------- |
| 4       | Christopher Haque | christopher.haque@mail.com | TICKET_MANAGER | +8801710000004 |
| 8       | Tanvir Ahmed      | tanvirA@mail.com           | FOOTBALL_FAN   | +8801710000103 |
| 33      | Tanvir Tareq      | tareqt@mail.com            | FOOTBALL_FAN   | +8801710000128 |
| 85      | Karim Haque       | karim.haque@mail.com       | FOOTBALL_FAN   | +8801710000180 |

```

## Part 03: Interview Prep:

Questions answered:

- Question 1: What role does a Foreign Key play in the Bookings table, and how does it safeguard against entering a ticket sale for a match that doesn't exist?

- answer: https://www.loom.com/share/3680f44a879d445682a77697c5eca8de

- Question 2: Why are we unable to use an aggregate function like COUNT(booking_id) inside a standard WHERE clause to filter match rows? How does HAVING solve this?

- answer: https://www.loom.com/share/4f5cc6eb7b234cd68dadd8324197a83b

- Question 4: Imagine a newly registered fan who hasn't bought any match tickets yet. If you run a LEFT JOIN linking the Users table (left) to the Bookings table (right), what will the resulting rows look like for that specific fan?

- answer: https://www.loom.com/share/69d4525858854ca598bf549dd95334b8

## Technology/Services Used:

1. ER Diagram: https://dbdiagram.io/home
2. SQL Query Writing: BeeKeepers <simple, gui>
3. ChatGPT helped me with creating the dataset
