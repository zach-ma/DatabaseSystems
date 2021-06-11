-- Lesson 1: Basic SQL

-- LIMIT
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- ORDER BY
-- DESC
-- NOTE  DESC can be added after the column in your ORDER BY statement to sort in descending order, as the default is to sort in ascending order.
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;
-- When you provide a list of columns in an ORDER BY command, the sorting occurs using the leftmost column in your list first, then the next column from the left, and so on.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;


-- WHERE
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;
-- SQL requires single-quotes, not double-quotes, around text values like 'Exxon Mobil.'
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';


-- Derived Columns
-- AS
-- Arithmetic operators
SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;


-- LIKE
-- %...%
SELECT *
FROM accounts
WHERE name LIKE 'C%'; --starts with 'C'

SELECT *
FROM accounts
WHERE name LIKE '%one%'; -- contains 'one'

SELECT *
FROM accounts
WHERE name LIKE '%s'; -- end with


-- IN
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

--  NOT
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';


-- AND and BETWEEN
-- WHERE column >= 6 AND column <= 10
-- equivalently, WHERE column BETWEEN 6 AND 10
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s'; 

SELECT *
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29; -- includes endpoints

-- NOTE
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- OR
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE '%W')
AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%ana%')
AND (primary_poc NOT LIKE '%eana%')

