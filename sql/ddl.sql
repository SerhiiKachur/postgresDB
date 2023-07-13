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