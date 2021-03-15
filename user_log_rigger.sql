
-- триггер пользователи
DROP TRIGGER IF EXISTS users_log;

DELIMITER //
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, name_value, created_time)
	VALUES ('users', NEW.id, NEW.name, NOW());
END //
DELIMITER ;