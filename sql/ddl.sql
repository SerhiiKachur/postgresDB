CREATE TABLE users(
  -- id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64)NOT NULL CHECK (first_name != ''),
  last_name VARCHAR(64)NOT NULL CHECK (last_name != ''),
  email VARCHAR(256)NOT NULL UNIQUE CONSTRAINT "invalid email"  CHECK (email ~ '^[a-zA-Z0-9]{1,32}@[a-z]{2,32}\.[a-z]{2,32}$'),
  height NUMERIC (3,2) NOT NULL CONSTRAINT "invalid height" CHECK (height > 0.4 AND height < 3),
  is_male BOOLEAN DEFAULT true,
  birthday DATE NOT NULL CHECK (birthday>'1900-01-01' AND birthday < current_date)
);

DROP TABLE users;

CREATE TABLE task_users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64)NOT NULL,
  last_name VARCHAR(64)NOT NULL,
  email VARCHAR(256)NOT NULL UNIQUE CONSTRAINT "invalid email"  CHECK (email ~ '^[a-zA-Z0-9]{1,32}@[a-z]{2,32}\.[a-z]{2,32}$'),
  height NUMERIC (3,2) NOT NULL CONSTRAINT "invalid height" CHECK (height > 0.4 AND height < 3),
  is_male BOOLEAN DEFAULT true,
  birthday DATE NOT NULL CHECK (birthday >'1900-01-01' AND birthday < current_date),
  weight NUMERIC (5,2) CONSTRAINT "weight must be 0 - 500kg" CHECK (weight > 0 AND weight < 500),
  raiting NUMERIC (2,1) CONSTRAINT "raiting must be 1.0-5.0" CHECK (raiting >= 1 AND raiting <= 5),
  CONSTRAINT "Unique full name" UNIQUE (first_name,last_name),
  CONSTRAINT "User must have correct name" CHECK (first_name != '' AND last_name != '')
)

DROP TABLE task_users;

ALTER TABLE users ADD COLUMN eye_color VARCHAR (100) NOT NULL DEFAULT 'brown' CHECK(eye_color != ''),
ADD COLUMN hair_color VARCHAR (100) CHECK (hair_color != '');

ALTER TABLE users DROP COLUMN hair_color;

ALTER TABLE users ADD COLUMN weight NUMERIC CONSTRAINT "weigth must be 1-500kg" CHECK (weight >= 1 AND weight <= 500),ADD COLUMN raiting NUMERIC (2,1) CONSTRAINT "raiting must be 1.0-5.0" CHECK (raiting >= 1 AND raiting <= 5);

ALTER TABLE users DROP COLUMN weight;

-- new DATABASE

CREATE DATABASE not_rozetka;