SELECT * FROM shop.users;

SELECT * FROM sample.users;

CREATE VIEW shop_users AS SELECT id, name FROM shop.users ORDER BY name;

SELECT * FROM shop_users ;


START TRANSACTION;
INSERT INTO sample.users (id, name)
  SELECT id, name 
  FROM shop.users 
    WHERE id = '1';

DELETE FROM shop.users
  WHERE WHERE id = '1';

COMMIT;

USE example;
DROP TABLE IF EXISTS date_table;
CREATE TABLE date_table (created_at DATE);

INSERT INTO date_table VALUES
('2021-05-14'),
('2021-06-15'),
('2021-07-26'),
('2021-08-27'),
('2021-01-01'),
('2021-02-02'),
('2021-03-03'),
('2021-12-03'),
('2021-10-03'),
('2021-03-14'),
('2021-09-28');
	
SELECT * FROM date_table;

SELECT created_at AS not_delet FROM date_table
WHERE created_at NOT IN (SELECT * FROM (SELECT * FROM date_table ORDER BY created_at DESC LIMIT 5) AS f) 
ORDER BY created_at DESC;

DELETE FROM date_table
WHERE created_at NOT IN (SELECT * FROM (SELECT * FROM date_table ORDER BY created_at DESC LIMIT 5) AS f) 
ORDER BY created_at DESC;

SELECT * FROM date_table ORDER BY created_at DESC;





