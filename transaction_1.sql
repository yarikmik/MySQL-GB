START TRANSACTION;
INSERT INTO sample.users (id, name)
  SELECT id, name 
  FROM shop.users 
    WHERE id = 1;

DELETE FROM shop.users WHERE id = 1;

COMMIT;