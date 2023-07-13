CREATE TABLE users(
  first_name VARCHAR(64)NOT NULL,
  last_name VARCHAR(64)NOT NULL,
  email VARCHAR(256)NOT NULL,
  height NUMERIC (3,2) NOT NULL,
  is_male BOOLEAN,
  birthday DATE NOT NULL
);

DROP TABLE users;