CREATE TABLE numbers(
  a INT,
  b INT
);

CREATE TABLE names(
  id INT,
  name VARCHAR(64)
);

INSERT INTO numbers
(a,b) VALUES
(1,1),
(2,85),
(3,-1525),
(4,6423122),
(5,929392999),
(10,562312);

INSERT INTO names
(id,name) VALUES
(1,'test'),
(2,'User'),
(5,'john'),
(6,'Jane');

SELECT * FROM names;

SELECT * FROM numbers;

SELECT * FROM names, numbers;

SELECT id FROM names
UNION
SELECT a FROM numbers;


SELECT id FROM names
INTERSECT
SELECT a FROM numbers;

SELECT id FROM names
EXCEPT
SELECT a FROM numbers;

