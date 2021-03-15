DELIMITER //
DROP PROCEDURE IF EXISTS  insert_range//
CREATE PROCEDURE insert_range()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 250 DO
    INSERT communities_users (user_id, community_id, created_at) VALUES (i, FLOOR(1 + RAND() * 20), NOW());
    SET i = i + 1;
  END WHILE;
END//
DELIMITER ;

CALL insert_range();

