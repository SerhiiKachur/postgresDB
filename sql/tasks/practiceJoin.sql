--1
SELECT p.*
FROM products p
JOIN products_to_orders pto
ON pto.product_id =  p.id
WHERE pto.order_id = 1;
--2
SELECT count(*)
FROM manufacturers m
JOIN products p
ON m.id = manufacturer_id
WHERE m.id = 3;
--
SELECT name, quantity
FROM manufacturers m
JOIN products p
ON m.id = manufacturer_id
WHERE m.id = 3;
--
SELECT sum(quantity)
FROM manufacturers m
JOIN products p
ON m.id = manufacturer_id
WHERE m.id = 3;
--3
SELECT sum(p.price * pto.quantity)
FROM products p
JOIN products_to_orders pto ON pto.product_id = p.id
WHERE order_id = 2;
--4 Вартість кожного замовлення
SELECT order_id, sum(p.price * pto.quantity)
FROM products p
JOIN products_to_orders pto ON pto.product_id = p.id
GROUP BY order_id
ORDER BY order_id;
--5
SELECT email, count(*)
FROM users u 
JOIN orders o ON o.customer_id = u.id
WHERE u.id= 4
GROUP BY u.id;
--6
SELECT p.name ,count(*) amount
FROM products p
JOIN products_to_orders pto ON pto.product_id = p.id
GROUP BY p.id
ORDER BY amount DESC
LIMIT 1;
--7
SELECT u.id user_id, p.id product_id
FROM users u
JOIN orders o ON o.customer_id = u.id
JOIN products_to_orders pto ON pto.order_id = o.id
JOIN products p ON p.id = pto.product_id
GROUP BY u.id, p.id;
--8
SELECT u.id user_id, p.id product_id
FROM users u
JOIN orders o ON o.customer_id=u.id
JOIN products_to_orders pto ON pto.order_id=o.id
JOIN products p ON p.id = pto.product_id
GROUP BY u.id, p.id;
--9
SELECT user_id, count(product_id) FROM (
SELECT u.id user_id, p.id product_id
FROM users u
JOIN orders o ON o.customer_id=u.id
JOIN products_to_orders pto ON pto.order_id=o.id
JOIN products p ON p.id = pto.product_id
GROUP BY u.id, p.id
) AS USER_ID_WITH_PRODUCT_ID 
GROUP BY user_id; 

--Всі замовлення з підсумковою вартістю, 
--яка є вищею ніж середня вартість замовлення
--(через підзапит).
  -- 1. кожне замовлення з його вартістю
SELECT order_id, sum(p.price * pto.quantity)
FROM products p
JOIN products_to_orders pto ON pto.product_id = p.id
GROUP BY order_id
ORDER BY order_id;    
  -- 2. знаходимо середню вартість замовлення
SELECT avg(total_price) FROM(
SELECT order_id, sum(p.price * pto.quantity) total_price
FROM products p
JOIN products_to_orders pto ON pto.product_id = p.id
GROUP BY order_id
ORDER BY order_id
)orders_with_prices;

  -- 3. збираємо у фінальне рішення 
SELECT order_id, total_price FROM (
  SELECT order_id, sum(p.price * pto.quantity) total_price
  FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  GROUP BY order_id
  ORDER BY order_id
) orders_with_prices
WHERE total_price > (SELECT avg(total_price) 
FROM (
  SELECT order_id ,sum(p.price * pto.quantity) total_price
  FROM products p
  JOIN products_to_orders pto ON pto.product_id = p.id
  GROUP BY order_id
  ORDER BY order_id
) orders_with_prices);


