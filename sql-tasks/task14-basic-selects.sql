-- Inesrt customers

INSERT INTO customers (id, name, city) VALUES
(1, 'Ahmad Ali', 'London'),
(2, 'Sara Khaled', 'Dubai'),
(3, 'Omar Hassan', 'New York'),
(4, 'Lina Samir', 'Tokyo'),
(5, 'Yousef Nasser', 'Paris');

-- Insert orders

INSERT INTO orders (id, customer_id, amount, status, created_at) VALUES
(1, 1, 25.50, 'paid', '2026-07-01'),
(2, 1, 40.00, 'shipped', '2026-07-02'),
(3, 1, 12.75, 'pending', '2026-07-03'),
(4, 2, 100.00, 'paid', '2026-07-01'),
(5, 2, 55.25, 'cancelled', '2026-07-04'),
(6, 2, 80.00, 'shipped', '2026-07-05'),
(7, 3, 15.00, 'pending', '2026-07-02'),
(8, 3, 200.00, 'paid', '2026-07-06'),
(9, 3, 35.50, 'shipped', '2026-07-07'),
(10, 4, 18.00, 'pending', '2026-07-03'),
(11, 4, 60.00, 'paid', '2026-07-08'),
(12, 4, 42.25, 'shipped', '2026-07-09'),
(13, 5, 90.00, 'paid', '2026-07-04'),
(14, 5, 30.00, 'cancelled', '2026-07-05'),
(15, 5, 120.00, 'shipped', '2026-07-10');

-- Select all customers in a specific city, sorted by name

SELECT *
FROM customers
WHERE city = 'Dubai'
ORDER BY name;

-- Select the 5 highest-value orders

SELECT id, amount, status
FROM orders
ORDER BY amount DESC
LIMIT 5;

-- Select all orders - where status is either paid or shipped

SELECT *
FROM orders
WHERE status IN ('paid', 'shipped');



