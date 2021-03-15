DROP PROCEDURE IF EXISTS insert_users ;
DELIMITER //
CREATE PROCEDURE insert_users ()
BEGIN
	DECLARE i INT DEFAULT 1000000;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
DELIMITER ;



SELECT * FROM test_users;
TRUNCATE TABLE test_users; 
CALL insert_users();