-- Task 15 - Joins

-- List every order with the customer name and city.
-- Join type: INNER JOIN
-- Reason: We only need orders that have a matching customer.

SELECT
    orders.id AS order_id,
    customers.name,
    customers.city,
    orders.amount,
    orders.status
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.id;


-- List all customers with any orders they have.
-- Join type: LEFT JOIN
-- Reason: We need all customers, even customers with no orders.

SELECT
    customers.name,
    customers.city,
    orders.id AS order_id,
    orders.amount,
    orders.status
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;


-- Find customers who have never placed an order.
-- Join type: LEFT JOIN
-- Reason: We keep all customers, then filter where no order was found.

SELECT
    customers.name
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.id IS NULL;
