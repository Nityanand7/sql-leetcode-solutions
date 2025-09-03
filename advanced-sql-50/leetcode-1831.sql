-- Write your PostgreSQL query statement below

SELECT transaction_id
FROM Transactions
WHERE (day, amount) IN
(SELECT day, max(amount)
FROM Transactions
GROUP BY day)
ORDER BY transaction_id