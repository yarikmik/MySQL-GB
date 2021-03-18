
-- создание архивной таблицы
CREATE TABLE logs (
	table_name VARCHAR(60) NOT NULL,
	id BIGINT(50)  NOT NULL,
	name_value VARCHAR(60) NOT NULL,
	created_time DATETIME NOT NULL
) ENGINE = ARCHIVE;


-- триггер каналы 
DROP TRIGGER IF EXISTS channels;

DELIMITER //
CREATE TRIGGER channels_log AFTER INSERT ON channels
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, name_value, created_time)
	VALUES ('channels', NEW.id, NEW.name, NOW());
END //
DELIMITER ;

-- триггер устройства 
DROP TRIGGER IF EXISTS deviсes;

DELIMITER //
CREATE TRIGGER deviсes_log AFTER INSERT ON deviсes
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, name_value, created_time)
	VALUES ('deviсes', NEW.id, NEW.device_name, NOW());
END //
DELIMITER ;



-- триггер пользователи 
DROP TRIGGER IF EXISTS users;

DELIMITER //
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, id, first_name, last_name, created_time)
	VALUES ('users', NEW.id, NEW.first_name, NEW.last_name, NOW());
END //
DELIMITER ;
