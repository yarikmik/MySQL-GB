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