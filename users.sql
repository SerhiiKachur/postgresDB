CREATE TABLE "Users"(
  is SERIAL PRIMARY KEY,
  "firstName" VARCHAR(255),
  "lastName" VARCHAR(255),
  "isMale" BOOLEAN,
  "createdAt" DATE NOT NULL,
  "updatedAt" DATE NOT NULL
);