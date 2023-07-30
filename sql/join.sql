SELECT * FROM users
JOIN orders ON orders.customer_id = users.id;

SELECT * FROM users
JOIN manufacturers ON users.id = user_id
JOIN orders ON users.id = customer_id;

SELECT * FROM orders
JOIN users ON customer_id = users.id
JOIN manufacturers ON user_id = users.id;

SELECT *
FROM orders AS o
JOIN products_to_orders pto ON o.id = pto.order_id
JOIN products p ON p.id = pto.product_id
WHERE o.id = 1;

SELECT order_id
FROM products p
JOIN products_to_orders pto ON p.id = product_id
WHERE p.category ILIKE 'food'
GROUP BY order_id
ORDER BY order_id ASC;

SELECT count(*)
FROM products_to_orders pto
JOIN products p ON p.id = pto.product_id
WHERE p.category ILIKE 'food' AND order_id = 32;

SELECT count(*),order_id
FROM products_to_orders pto
JOIN products p ON p.id = pto.product_id
WHERE p.category ILIKE 'food'
GROUP BY order_id
ORDER BY count(*) DESC;


