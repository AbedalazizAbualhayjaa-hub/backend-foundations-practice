-- Task 17 - Subqueries, CTEs, and Optimization

-- Using a CTE, find each customer's total spending and return the top 3 spenders.

WITH customer_totals AS (
    SELECT
        customers.name,
        SUM(orders.amount) AS total_spending
    FROM customers
    JOIN orders
    ON customers.id = orders.customer_id
    GROUP BY customers.id, customers.name
)
SELECT
    name,
    total_spending
FROM customer_totals
ORDER BY total_spending DESC
LIMIT 3;

-- Using a subquery, find customers who placed at least one order above the overall average order amount.

SELECT DISTINCT
    customers.name
FROM customers
JOIN orders
ON customers.id = orders.customer_id
WHERE orders.amount > (
    SELECT AVG(amount)
    FROM orders
);

-- EXPLAIN before adding the index.

DROP INDEX IF EXISTS idx_orders_customer_id;

EXPLAIN QUERY PLAN
SELECT
    customers.name,
    customers.city,
    orders.id AS order_id,
    orders.amount,
    orders.status
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;


-- CREATE INDEX statement.

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);


-- EXPLAIN after adding the index.

EXPLAIN QUERY PLAN
SELECT
    customers.name,
    customers.city,
    orders.id AS order_id,
    orders.amount,
    orders.status
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

-- Note:
-- Before adding the index, EXPLAIN showed that SQLite had to scan the orders table without my own index on customer_id.
-- After adding idx_orders_customer_id, EXPLAIN showed that SQLite can use this index when matching orders with customers during the join.
