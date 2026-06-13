# nextLevelAssignment03Hamid

## Brief Description:

In this work, we practice on several core backend skills: creating ER-Diagrams using various tools, defining schemas and tables (with data), and running queries (sql).

## Part 01: Entity-Relationship Diagram (ERD) Design:

- https://dbdiagram.io/d/hamidNextLevelB7A3Solution-6a2d53299340ecc0658daea6

## Part 02: SQL Queries & Expected Sample Output:

- [**View SQL Query File**](./QUERY.sql)

```sql

-- Query 01:

SELECT
	match_id,
	fixture,
	base_ticket_price
FROM
	matches
WHERE
	tournament_category = 'Champions League'
	AND match_status = 'AVAILABLE';
```

-- Sample Outcome:

```text
-------------------------------------------------------------
| match_id | fixture                    | base_ticket_price |
| -------- | -------------------------- | ----------------- |
| 1        | Real Madrid vs Barcelona   | 150.00            |
| 3        | Bayern Munich vs PSG       | 130.00            |
| 47       | Barcelona vs Bayern Munich | 165.00            |
| 49       | Real Madrid vs PSG         | 175.00            |
-------------------------------------------------------------
```

```sql
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


-- Query 03:

SELECT
	booking_id,
	user_id,
	match_id,
	COALESCE(payment_status::text, 'ACTION REQUIRED') AS systematic_status
FROM
	bookings
WHERE
	payment_status IS NULL;

-- Sample Output:

| booking_id | user_id | match_id | systematic_status |
| ---------- | ------- | -------- | ----------------- |
| 18         | 71      | 38       | ACTION REQUIRED   |
| 31         | 39      | 46       | ACTION REQUIRED   |


-- Query 04:
SELECT
	b.booking_id,
	u.full_name,
	m.fixture,
	b.total_cost
FROM
	bookings b
	JOIN users u ON b.user_id = u.user_id
	JOIN matches m ON b.match_id = m.match_id;

-- Sample Output:
| booking_id | full_name       | fixture                            | total_cost |
| ---------- | --------------- | ---------------------------------- | ---------- |
| 1          | James Foster    | Juventus vs Roma                   | 150.00     |
| 2          | James Foster    | Inter Milan vs Napoli              | 230.00     |
| 3          | Tanvir Tareq    | Juventus vs Roma                   | 155.00     |
| 4          | Sean Brooks     | AC Milan vs Lazio                  | 120.00     |
| 5          | Tanvir Tareq    | AC Milan vs Lazio                  | 115.00     |
| 6          | David Reynolds  | Bayern Munich vs Dortmund          | 130.00     |
| 7          | Karim Haque     | Barcelona vs Atletico Madrid       | 90.00      |
| 8          | Nathan Allen    | Real Madrid vs Bayern Munich       | 80.00      |
| 9          | Alexander King  | Bayern Munich vs RB Leipzig        | 110.00     |
| 10         | Jack Kelly      | AC Milan vs Fiorentina             | 115.00     |
| 11         | Nathan Hall     | PSG vs Marseille                   | 100.00     |
| 12         | Andrew Thompson | Inter Milan vs Juventus            | 95.00      |
| 13         | Ian Rogers      | Bayern Munich vs PSG               | 125.00     |
| 14         | Tyler Cox       | Arsenal vs Liverpool               | 105.00     |
| 15         | Daniel Cooper   | Liverpool vs Everton               | 85.00      |
| 16         | James Walker    | PSG vs Rennes                      | 98.00      |
| 17         | Ahmed Reza      | Real Madrid vs Sevilla             | 115.00     |
| 18         | Aiden James     | PSG vs Nice                        | 90.00      |
| 19         | Connor Hall     | Arsenal vs Chelsea                 | 100.00     |
| 20         | Michael Carter  | Real Madrid vs Atletico Madrid     | 92.00      |
| 21         | Noah Bennett    | Manchester United vs Arsenal       | 88.00      |
| 22         | Adam Rogers     | Chelsea vs Arsenal                 | 118.00     |
| 23         | Samuel Price    | Borussia Dortmund vs Leipzig       | 95.00      |
| 24         | Harry Collins   | Manchester City vs Liverpool       | 155.00     |
| 25         | Joshua Allen    | Manchester City vs Newcastle       | 110.00     |
| 26         | Edward Clark    | Liverpool vs Brighton              | 100.00     |
| 27         | Aaron Bell      | Borussia Dortmund vs Bayern Munich | 90.00      |
| 28         | Joshua Bennett  | PSG vs Monaco                      | 130.00     |
| 29         | Patrick Murphy  | Inter Milan vs Napoli              | 125.00     |
| 30         | Jason Walker    | Bayern Munich vs Frankfurt         | 92.00      |
| 31         | Jordan Perry    | Liverpool vs Man United            | 108.00     |
| 32         | George Cox      | AC Milan vs Inter Milan            | 97.00      |
| 33         | Lucas James     | PSG vs Lille                       | 140.00     |

-- Query 05:

SELECT
	u.user_id,
	u.full_name,
	b.booking_id
FROM
	users u
	LEFT JOIN bookings b ON u.user_id = b.user_id
order by
	u.user_id;

-- Sample Output:

| user_id | full_name         | booking_id |
| ------- | ----------------- | ---------- |
| 1       | Jonathan Miller   |            |
| 2       | Michael Carter    | 20         |
| 3       | David Reynolds    | 6          |
| 4       | Christopher Haque |            |
| 5       | Andrew Thompson   | 12         |
| 6       | Jason Walker      | 30         |
| 7       | Ethan Brooks      |            |
| 8       | Tanvir Ahmed      |            |
| 9       | Daniel Cooper     | 15         |
| 10      | Matthew Turner    |            |
| 11      | Joshua Bennett    | 28         |
| 12      | James Foster      | 2          |
| 12      | James Foster      | 1          |
| 13      | Benjamin Ross     |            |
| 14      | Alexander Reed    |            |
| 15      | Samuel Price      | 23         |
| 16      | Noah Murphy       |            |
| 17      | Liam Hughes       |            |
| 18      | Jack Kelly        | 10         |
| 19      | Oliver Ward       |            |
| 20      | Henry Cox         |            |
| 21      | Lucas James       | 33         |
| 22      | Elijah Scott      |            |
| 23      | Ahmed Reza        | 17         |
| 24      | Logan Baker       |            |
| 25      | Sebastian Adams   |            |
| 26      | George Hill       |            |
| 27      | Edward Clark      | 26         |
| 28      | Thomas Lewis      |            |
| 29      | Nathan Allen      | 8          |
| 30      | Caleb Young       |            |
| 31      | Isaac King        |            |
| 32      | Aaron Wright      |            |
| 33      | Tanvir Tareq      | 5          |
| 33      | Tanvir Tareq      | 3          |
| 34      | Connor Hall       | 19         |
| 35      | Adam Carter       |            |
| 36      | Brian Murphy      |            |
| 37      | Eric Rogers       |            |
| 38      | Kyle Morgan       |            |
| 39      | Jordan Perry      | 31         |
| 40      | Justin Howard     |            |
| 41      | Tyler Cox         | 14         |
| 42      | Brandon Ward      |            |
| 43      | Kevin Bennett     |            |
| 44      | Mark Foster       |            |
| 45      | Paul Reed         |            |
| 46      | Scott Mitchell    |            |
| 47      | Sean Brooks       | 4          |
| 48      | Greg Anderson     |            |
| 49      | Harry Collins     | 24         |
| 50      | Owen Stewart      |            |
| 51      | Evan Morris       |            |
| 52      | Ian Rogers        | 13         |
| 53      | Patrick Murphy    | 29         |
| 54      | Cameron Bell      |            |
| 55      | Dylan Ward        |            |
| 56      | Ryan Foster       |            |
| 57      | Ethan Carter      |            |
| 58      | Noah Bennett      | 21         |
| 59      | Liam Brooks       |            |
| 60      | James Walker      | 16         |
| 61      | Benjamin Scott    |            |
| 62      | Lucas Reed        |            |
| 63      | Henry Adams       |            |
| 64      | Alexander King    | 9          |
| 65      | Matthew Hill      |            |
| 66      | Joshua Allen      | 25         |
| 67      | Daniel Young      |            |
| 68      | Jack Lewis        |            |
| 69      | Samuel Clark      |            |
| 70      | Elijah Morgan     |            |
| 71      | Aiden James       | 18         |
| 72      | Logan Wright      |            |
| 73      | Sebastian Murphy  |            |
| 74      | George Cox        | 32         |
| 75      | Edward Perry      |            |
| 76      | Thomas Howard     |            |
| 77      | Nathan Hall       | 11         |
| 78      | Caleb Cox         |            |
| 79      | Isaac Ward        |            |
| 80      | Aaron Bell        | 27         |
| 81      | Luke Morgan       |            |
| 82      | Connor Baker      |            |
| 83      | Adam Rogers       | 22         |
| 84      | Brian Perry       |            |
| 85      | Karim Haque       | 7          |


-- Query 06:

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

-- Sample Output:

| booking_id | user_id | match_id | seat_number | payment_status | total_cost |
| ---------- | ------- | -------- | ----------- | -------------- | ---------- |
| 1          | 12      | 5        | A-10        | CONFIRMED      | 150.00     |
| 2          | 12      | 12       | BB-10       | CONFIRMED      | 230.00     |
| 3          | 33      | 5        | A-11        | CONFIRMED      | 155.00     |
| 4          | 47      | 18       | B-04        | PENDING        | 120.00     |
| 5          | 33      | 18       | A-11        | CONFIRMED      | 115.00     |
| 6          | 3       | 22       |             | FAILED         | 130.00     |
| 10         | 18      | 33       | E-11        | CONFIRMED      | 115.00     |
| 13         | 52      | 3        | B-12        | CONFIRMED      | 125.00     |
| 17         | 23      | 11       | A-14        | CONFIRMED      | 115.00     |
| 22         | 83      | 14       | C-22        | CONFIRMED      | 118.00     |
| 24         | 49      | 2        |             | FAILED         | 155.00     |
| 28         | 11      | 24       | E-05        | CONFIRMED      | 130.00     |
| 29         | 53      | 12       | A-20        | CONFIRMED      | 125.00     |
| 33         | 21      | 31       |             | CONFIRMED      | 140.00     |

-- Query 07:

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

-- Sample Output:

| match_id | fixture                      | tournament_category | base_ticket_price | match_status |
| -------- | ---------------------------- | ------------------- | ----------------- | ------------ |
| 41       | Real Madrid vs Bayern Munich | Champions League    | 170.00            | SELLING_FAST |
| 47       | Barcelona vs Bayern Munich   | Champions League    | 165.00            | AVAILABLE    |


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
