INSERT INTO users(
  height,
  first_name,
  last_name,
  birthday,
  email,
  is_male,
  weight,
  raiting
)
VALUES
(1.01,'User1','Userenko', '1999-01-01', 'mail@mail.com',true,123,2.5),
(1.61,'User2','Userenko', '1999-01-02', 'mail2@gmail.com',true,233,1.0),
(1.35,'User3','Userenko', '1983-05-14','mail3@mail.com',false,122,5.0),
(2.5,'User4','Userenko', '1999-01-01','mail4@mail.com',true,185,1.4);

UPDATE users SET weight = 60;
UPDATE users SET weight = 75 WHERE is_male = TRUE;
UPDATE users SET height = 1.67 WHERE id = 3;

UPDATE users SET is_male = false WHERE id =3;

DELETE FROM users WHERE id = 3;
DELETE FROM users; -- delete all 


UPDATE users SET raiting = 3.50 WHERE id = 8 RETURNING id,raiting;
DELETE FROM users WHERE id = 9 RETURNING *;

UPDATE users SET 
first_name = 'Anton', 
last_name = 'Shevchenko', 
email = 'antonsheva@mail.com',
weight = 123
WHERE id = 8;