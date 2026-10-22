# SQL Practice: Date Functions, Date Ranges, Self Joins & Subqueries.

## Level 1: Extracting Parts of a Date

1. Return the names of staff hired in 2021.
2. Return each staff member’s name and the month number of their hire date.
3. Return sales made in February 2024 (any day in that month).
4. Return the ID and day name (Monday, Tuesday, ...) of each sale.

## Level 2: Date Ranges and Arithmetic

5. Return sales between `2024-01-15` and `2024-02-28`, inclusive.
6. Return staff hired more than 1000 days before `2024-01-01`. Use `DATEDIFF`.
7. For each staff member, return their name and the date of their 1-year work anniversary.
8. Return the sale(s) with the most recent `orderDate`, using a subquery. Do not use `ORDER BY` or `LIMIT`.

## Level 3: Grouping by Date Parts

9. Return each month (as `YYYY-MM`) with its total sales amount.
10. Return the months where total sales are above 1000.
11. Return the number of staff hired in each year.

## Level 4: Self Joins on Dates

12. Return the ID of Weather days that were warmer than the previous calendar day. Try this from scratch without looking.
13. Return the ID of Weather days that were cooler than the previous calendar day.
14. For each sale, find the previous sale of the same customer and show both amounts side by side. Only include a pair if the two sales are within 30 days of each other, with the later one on the right.
15. Return pairs of staff members hired within 180 days of each other. Each pair should appear only once, and no one should pair with themselves.

## Level 5: Challenge

16. Return the staff member(s) hired closest to the most recent hire date, but not the most recent hire themselves. Think: second most recent hire date, using `MAX` and a subquery.
17. Return customers whose sales in January 2024 total more than their sales in February 2024. Use two grouped subqueries joined together.
18. Return Weather days whose temperature is higher than both the previous day and the next day (calendar days, no gaps).

---

# Tables Provided

## Weather

| id | recordDate | temperature |
|---:|---|---:|
| 1 | 2015-01-01 | 10 |
| 2 | 2015-01-02 | 25 |
| 3 | 2015-01-03 | 20 |
| 4 | 2015-01-04 | 30 |
| 5 | 2015-01-07 | 28 |
| 6 | 2015-01-08 | 35 |

## Staff

| id | name | hireDate | salary |
|---:|---|---|---:|
| 1 | Asha | 2019-03-15 | 70000 |
| 2 | Ravi | 2021-07-01 | 85000 |
| 3 | Meena | 2021-12-20 | 60000 |
| 4 | Karan | 2022-01-10 | 85000 |
| 5 | Divya | 2023-05-25 | 50000 |
| 6 | Imran | 2020-11-30 | 90000 |

## Sales

| id | customerId | orderDate | amount |
|---:|---:|---|---:|
| 1 | 1 | 2024-01-05 | 600 |
| 2 | 1 | 2024-01-20 | 700 |
| 3 | 2 | 2024-02-14 | 300 |
| 4 | 4 | 2024-02-28 | 450 |
| 5 | 2 | 2024-03-03 | 520 |
| 6 | 1 | 2024-03-15 | 250 |

---

**Suggested approach:** Solve one question at a time. Start with Level 1 and move up only when you are comfortable with the current level.
