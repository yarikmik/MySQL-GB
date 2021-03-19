-- по имени оборудования возвращает локацию сервис статус
DROP PROCEDURE IF EXISTS getDeviceInfo;
DELIMITER //
CREATE PROCEDURE getDeviceInfo(IN devname varchar(100))
   LANGUAGE SQL
   NOT DETERMINISTIC
   CONTAINS SQL
   SQL SECURITY DEFINER
   COMMENT 'по имени оборудования возвращает локацию, сервис, статус'
BEGIN
   SELECT d.device_name, l.location_name, s.name AS service, st.name AS status
     FROM deviсes d, location l, services s, status st WHERE d.device_name COLLATE utf8mb4_general_ci = devname AND l.id = d.location_id AND s.id = d.services_id AND st.id = d.status_id; 
END//
DELIMITER ;




