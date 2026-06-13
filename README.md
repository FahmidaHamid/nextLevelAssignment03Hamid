# nextLevelAssignment03Hamid

## Brief Description:

In this work, we practice on several core backend skills: creating ER-Diagrams using various tools, defining schemas and tables (with data), and running queries (sql).

## Part 01: Entity-Relationship Diagram (ERD) Design:

- https://dbdiagram.io/d/hamidNextLevelB7A3Solution-6a2d53299340ecc0658daea6

## Part 02: SQL Queries & Expected Sample Output:

- [**View SQL Query File**](./QUERY.sql)

### Query 01:

```sql
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

### Sample Output:

```text
| match_id | fixture                    | base_ticket_price |
| -------- | -------------------------- | ----------------- |
| 1        | Real Madrid vs Barcelona   | 150.00            |
| 3        | Bayern Munich vs PSG       | 130.00            |
| 47       | Barcelona vs Bayern Munich | 165.00            |
| 49       | Real Madrid vs PSG         | 175.00            |
```

### Query 02:

```sql
SELECT
	*
FROM
	users
WHERE
	full_name ILIKE 'Tanvir%'
	OR full_name ILIKE '%Haque%';
```

### Sample Output:

```text
| user_id | full_name         | email                      | role           | phone_number   |
| ------- | ----------------- | -------------------------- | -------------- | -------------- |
| 4       | Christopher Haque | christopher.haque@mail.com | TICKET_MANAGER | +8801710000004 |
| 8       | Tanvir Ahmed      | tanvirA@mail.com           | FOOTBALL_FAN   | +8801710000103 |
| 33      | Tanvir Tareq      | tareqt@mail.com            | FOOTBALL_FAN   | +8801710000128 |
| 85      | Karim Haque       | karim.haque@mail.com       | FOOTBALL_FAN   | +8801710000180 |

```

### Query 03:

```sql
SELECT
	booking_id,
	user_id,
	match_id,
	COALESCE(payment_status::text, 'ACTION REQUIRED') AS systematic_status
FROM
	bookings
WHERE
	payment_status IS NULL;

```

### Sample Output:

```text
| booking_id | user_id | match_id | systematic_status |
| ---------- | ------- | -------- | ----------------- |
| 18         | 71      | 38       | ACTION REQUIRED   |
| 31         | 39      | 46       | ACTION REQUIRED   |

```

### Query 04:

```sql
SELECT
	b.booking_id,
	u.full_name,
	m.fixture,
	b.total_cost
FROM
	bookings b
	JOIN users u ON b.user_id = u.user_id
	JOIN matches m ON b.match_id = m.match_id;

```

### Sample Output:

```text
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
```

### Query 05:

```sql
SELECT
	u.user_id,
	u.full_name,
	coalesce(b.booking_id::text, 'NULL') as possible_bookings
FROM
	users u
	LEFT JOIN bookings b ON u.user_id = b.user_id
-- WHERE u.role = 'FOOTBALL_FAN'
order by
	u.user_id;
```

### Sample Output:

```text
| user_id | full_name         | possible_bookings |
| ------- | ----------------- | ----------------- |
| 1       | Jonathan Miller   | NULL              |
| 2       | Michael Carter    | 20                |
| 3       | David Reynolds    | 6                 |
| 4       | Christopher Haque | NULL              |
| 5       | Andrew Thompson   | 12                |
| 6       | Jason Walker      | 30                |
| 7       | Ethan Brooks      | NULL              |
| 8       | Tanvir Ahmed      | NULL              |
| 9       | Daniel Cooper     | 15                |
| 10      | Matthew Turner    | NULL              |
| 11      | Joshua Bennett    | 28                |
| 12      | James Foster      | 2                 |
| 12      | James Foster      | 1                 |
| 13      | Benjamin Ross     | NULL              |
| 14      | Alexander Reed    | NULL              |
| 15      | Samuel Price      | 23                |
| 16      | Noah Murphy       | NULL              |
| 17      | Liam Hughes       | NULL              |
| 18      | Jack Kelly        | 10                |
| 19      | Oliver Ward       | NULL              |
| 20      | Henry Cox         | NULL              |
| 21      | Lucas James       | 33                |
| 22      | Elijah Scott      | NULL              |
| 23      | Ahmed Reza        | 17                |
| 24      | Logan Baker       | NULL              |
| 25      | Sebastian Adams   | NULL              |
| 26      | George Hill       | NULL              |
| 27      | Edward Clark      | 26                |
| 28      | Thomas Lewis      | NULL              |
| 29      | Nathan Allen      | 8                 |
| 30      | Caleb Young       | NULL              |
| 31      | Isaac King        | NULL              |
| 32      | Aaron Wright      | NULL              |
| 33      | Tanvir Tareq      | 5                 |
| 33      | Tanvir Tareq      | 3                 |
| 34      | Connor Hall       | 19                |
| 35      | Adam Carter       | NULL              |
| 36      | Brian Murphy      | NULL              |
| 37      | Eric Rogers       | NULL              |
| 38      | Kyle Morgan       | NULL              |
| 39      | Jordan Perry      | 31                |
| 40      | Justin Howard     | NULL              |
| 41      | Tyler Cox         | 14                |
| 42      | Brandon Ward      | NULL              |
| 43      | Kevin Bennett     | NULL              |
| 44      | Mark Foster       | NULL              |
| 45      | Paul Reed         | NULL              |
| 46      | Scott Mitchell    | NULL              |
| 47      | Sean Brooks       | 4                 |
| 48      | Greg Anderson     | NULL              |
| 49      | Harry Collins     | 24                |
| 50      | Owen Stewart      | NULL              |
| 51      | Evan Morris       | NULL              |
| 52      | Ian Rogers        | 13                |
| 53      | Patrick Murphy    | 29                |
| 54      | Cameron Bell      | NULL              |
| 55      | Dylan Ward        | NULL              |
| 56      | Ryan Foster       | NULL              |
| 57      | Ethan Carter      | NULL              |
| 58      | Noah Bennett      | 21                |
| 59      | Liam Brooks       | NULL              |
| 60      | James Walker      | 16                |
| 61      | Benjamin Scott    | NULL              |
| 62      | Lucas Reed        | NULL              |
| 63      | Henry Adams       | NULL              |
| 64      | Alexander King    | 9                 |
| 65      | Matthew Hill      | NULL              |
| 66      | Joshua Allen      | 25                |
| 67      | Daniel Young      | NULL              |
| 68      | Jack Lewis        | NULL              |
| 69      | Samuel Clark      | NULL              |
| 70      | Elijah Morgan     | NULL              |
| 71      | Aiden James       | 18                |
| 72      | Logan Wright      | NULL              |
| 73      | Sebastian Murphy  | NULL              |
| 74      | George Cox        | 32                |
| 75      | Edward Perry      | NULL              |
| 76      | Thomas Howard     | NULL              |
| 77      | Nathan Hall       | 11                |
| 78      | Caleb Cox         | NULL              |
| 79      | Isaac Ward        | NULL              |
| 80      | Aaron Bell        | 27                |
| 81      | Luke Morgan       | NULL              |
| 82      | Connor Baker      | NULL              |
| 83      | Adam Rogers       | 22                |
| 84      | Brian Perry       | NULL              |
| 85      | Karim Haque       | 7                 |
```

### Query 06:

```sql
SELECT
	b.booking_id,
    b.match_id,
    b.total_cost
from
	bookings b
where
	b.total_cost > (
		select
			avg(bookings.total_cost)
		from
			bookings
	);

```

### Sample Output:

```text
| booking_id | match_id | total_cost |
| ---------- | -------- | ---------- |
| 1          | 5        | 150.00     |
| 2          | 12       | 230.00     |
| 3          | 5        | 155.00     |
| 4          | 18       | 120.00     |
| 5          | 18       | 115.00     |
| 6          | 22       | 130.00     |
| 10         | 33       | 115.00     |
| 13         | 3        | 125.00     |
| 17         | 11       | 115.00     |
| 22         | 14       | 118.00     |
| 24         | 2        | 155.00     |
| 28         | 24       | 130.00     |
| 29         | 12       | 125.00     |
| 33         | 31       | 140.00     |
```

### Query 07:

```sql
SELECT
	m.match_id,
    m.fixture,
    m.base_ticket_price
from
	matches m
order by
	m.base_ticket_price desc
limit
	2
offset
	1;

```

### Sample Output:

```text
| match_id | fixture                      | base_ticket_price |
| -------- | ---------------------------- | ----------------- |
| 41       | Real Madrid vs Bayern Munich | 170.00            |
| 47       | Barcelona vs Bayern Munich   | 165.00            |

```

## Part 03: Interview Q/A:

Questions answered:

- **Question 1:** What role does a Foreign Key play in the Bookings table, and how does it safeguard against entering a ticket sale for a match that doesn't exist?

- answer: https://www.loom.com/share/3680f44a879d445682a77697c5eca8de

- **Question 2:** Why are we unable to use an aggregate function like COUNT(booking_id) inside a standard WHERE clause to filter match rows? How does HAVING solve this?

- answer: https://www.loom.com/share/4f5cc6eb7b234cd68dadd8324197a83b

- **Question 4:** Imagine a newly registered fan who hasn't bought any match tickets yet. If you run a LEFT JOIN linking the Users table (left) to the Bookings table (right), what will the resulting rows look like for that specific fan?

- answer: https://www.loom.com/share/69d4525858854ca598bf549dd95334b8

## Technology/Services Used:

1. ER Diagram: https://dbdiagram.io/home
2. SQL Query Writing: BeeKeepers <simple, gui>
3. ChatGPT helped me with creating the dataset
