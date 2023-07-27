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