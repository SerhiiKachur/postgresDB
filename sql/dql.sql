-- Poluchenie dannih so vsey tablici

SELECT * FROM users;

SELECT id, email, first_name FROM users;

SELECT random ();

SELECT * FROM users WHERE is_male = true AND height < 1.02;

SELECT id, email, concat(first_name, ' ', last_name) AS "full_name", birthday
FROM users
WHERE length(concat(first_name, ' ', last_name)) < 16
;

SELECT * FROM (SELECT id, email, concat(first_name, ' ', last_name) AS "full_name", birthday
FROM users) AS "user_full_name" WHERE length(full_name) > 16;

SELECT * FROM users ORDER BY height DESC, foot_size ASC;


-- SELECT * FROM users order by weight ASC, birthday DESC, foot_size DESC;

SELECT id, weight, birthday, foot_size
FROM users
ORDER BY weight ASC, birthday DESC, foot_size DESC;

SELECT * 
FROM users
WHERE first_name ILIKE 'p%';

SELECT * 
FROM users
WHERE first_name SIMILAR TO '%o{2}%';