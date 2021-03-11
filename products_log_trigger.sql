-- триггер продукция
DROP TRIGGER IF EXISTS products_log;

DELIMITER //
CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, name_value, created_time)
	VALUES ('products', NEW.id, NEW.name, NOW());
END //
DELIMITER ;