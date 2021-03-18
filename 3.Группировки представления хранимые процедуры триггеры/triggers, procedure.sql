
-- проверка заполнения необходимых столбцов при вводе нового устройства
DROP TRIGGER IF EXISTS add_devices;
DELIMITER //
CREATE TRIGGER add_devices BEFORE INSERT ON inventory.deviсes
FOR EACH ROW
BEGIN
  IF(ISNULL(NEW.device_name) AND 
  ISNULL(NEW.description) AND 
  ISNULL(NEW.location_id) AND 
  ISNULL(NEW.device_type_id) AND 
  ISNULL(NEW.device_model_id) AND 
  ISNULL(NEW.status_id)) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Отмена операции, необходимо заполнить поля: device_name, description, location_id, device_type_id, device_model_id, status_id';
  END IF;
END //
DELIMITER ;
