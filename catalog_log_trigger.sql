-- триггер каталог
DROP TRIGGER IF EXISTS catalogs_log;

DELIMITER //
CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, name_value, created_time)
	VALUES ('catalogs', NEW.id, NEW.name, NOW());
END //
DELIMITER ;