SELECT avg(foot_size) FROM users; 

SELECT min(foot_size) FROM users;

SELECT avg(weight) FROM users;

SELECT count(*) FROM users WHERE foot_size = 50;

SELECT foot_size FROM users GROUP BY foot_size;

SELECT count(*) AS "кількість", is_male FROM users GROUP BY is_male;

SELECT count(*) AS "foot-size-count", foot_size FROM users GROUP BY foot_size;

SELECT avg(height) FROM users;
SELECT avg(height) AS "seredniy zrist", is_male FROM users GROUP BY is_male;
SELECT min(foot_size) AS "min-foot-size", is_male FROM users GROUP BY is_male;
SELECT min(weight),max(weight),avg(weight) AS "weight-info", is_male FROM users GROUP BY is_male;

SELECT avg(height),is_male FROM users WHERE weight < 100 GROUP BY is_male;

SELECT * FROM (
  SELECT count(*) amount, hair_color
  FROM users
  GROUP BY hair_color
) hc_amount
WHERE amount > 30;

SELECT count(*) , hair_color 
FROM users 
GROUP BY hair_color
HAVING count(*) > 30;

SELECT avg(foot_size), hair_color
FROM users
GROUP BY hair_color
HAVING avg(foot_size) >= 35;