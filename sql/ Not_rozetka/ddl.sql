CREATE TABLE products (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(200) NOT NULL CHECK ("name" != ''),
  "category" VARCHAR(128) NOT NULL CHECK ("category" != ''),
  "price" NUMERIC(15, 2),
  CHECK ("price" > 0),
  "quantity" INT NOT NULL CHECK ("quantity" >= 0),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp,
  UNIQUE ("name", "category")
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64) NOT NULL CHECK (last_name != ''),
  email VARCHAR(128) NOT NULL UNIQUE CHECK (email != ''),
  "password" VARCHAR(64) NOT NULL CHECK ("password" != ''),
  foot_size NUMERIC (3,1) CHECK (foot_size BETWEEN 20 AND 50),
  is_male BOOLEAN,
  hair_color VARCHAR(64) CHECK (hair_color != ''),
  weight NUMERIC(5,2) CHECK (weight BETWEEN 0.1 AND 999),
  height NUMERIC(3,2) CHECK (height BETWEEN 0.5 AND 3), 
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);


CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);

DROP TABLE orders;
--m:n
CREATE TABLE products_to_orders (
  product_id INT REFERENCES products ON DELETE CASCADE ON UPDATE CASCADE,
  order_id INT REFERENCES orders ON DELETE CASCADE ON UPDATE CASCADE,
  quantity INT NOT NULL CHECK (quantity > 0),
  PRIMARY KEY (product_id, order_id)
);
INSERT INTO users (
    first_name,
    last_name,
    email,
    password
  )
VALUES (
    'Anton',
    'Shevchenko',
    'anton@gmail.com',
    '12345admin'
  ),
  (
    'User',
    'Userenko',
    'user@gmail.com',
    'sada12324s'
  );
INSERT INTO orders(customer_id)
VALUES (1),
  (2),
  (1),
  (1);

INSERT INTO products (name, category, price, quantity)
VALUES (
    'пилосос',
    'побутова техніка',
    9999.99,
    1000
  ),
  (
    'IPhone XXV',
    'смартфони',
    34999.99,
    1500
  ),
  (
    'Телевізор',
    'побутова техніка',
    59999.99,
    1500
  ),
  (
    'Чайник',
    'дрібна техніка',
    1500,
    73
  );

INSERT INTO products_to_orders (order_id, product_id, quantity)
VALUES (2, 2, 2),
(3, 4, 1),
(4, 1, 3),
(4, 3, 1),
(5, 2, 1),
(5, 1, 1);


CREATE TABLE manufacturers(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL UNIQUE REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NOT NULL DEFAULT current_timestamp
);


ALTER TABLE users
ADD COLUMN manufacturers_id INT UNIQUE REFERENCES manufacturers ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO manufacturers (user_id) VALUES (2);

UPDATE users SET manufacturers_id = 1 WHERE id = 2;


DROP TABLE users CASCADE;
DROP TABLE orders CASCADE;
DROP TABLE products_to_orders CASCADE;
DROP TABLE manufacturers CASCADE;
DROP TABLE products CASCADE;