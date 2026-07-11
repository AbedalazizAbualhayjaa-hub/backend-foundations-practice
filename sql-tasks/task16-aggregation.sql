-- Task 16 — Aggregation

-- 1. Total and average order amount per customer

SELECT
    customers.name,
    SUM(orders.amount) AS total_amount,
    AVG(orders.amount) AS average_amount
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id, customers.name;


-- 2. Customers whose total spending is more than 100

SELECT
    customers.name,
    SUM(orders.amount) AS total_spending
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id, customers.name
HAVING SUM(orders.amount) > 100;


-- 3. Count the number of orders in each status

SELECT
    status,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY status;


-- 4. Find the day with the highest total order amount

SELECT
    DATE(created_at) AS order_day,
    SUM(amount) AS total_amount
FROM orders
GROUP BY DATE(created_at)
ORDER BY total_amount DESC
LIMIT 1;
