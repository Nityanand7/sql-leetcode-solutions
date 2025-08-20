-- Write your PostgreSQL query statement below

WITH total_bal as
(SELECT account, SUM(amount) as balance
FROM Transactions
GROUP BY account)

SELECT u.name, balance
FROM Users u
LEFT JOIN total_bal t 
ON u.account = t.account
WHERE t.balance > 10000

