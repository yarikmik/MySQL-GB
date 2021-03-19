-- по имени канала возвращает провайдера, локации канала
DROP PROCEDURE IF EXISTS getChannelInfo;
DELIMITER //
CREATE PROCEDURE getChannelInfo(IN chname varchar(100))
   LANGUAGE SQL
   NOT DETERMINISTIC
   CONTAINS SQL
   SQL SECURITY DEFINER
   COMMENT 'по имени канала возвращает провайдера, локации канала'
BEGIN
  SELECT DISTINCT channels.name AS channels, providers.name AS providers, to_loc.location_name,from_loc.location_name 
	FROM channels
		JOIN providers
		ON channels.provider_id = providers.id 
		JOIN location to_loc 
		ON to_loc.id = channels.to_location_id 		
		JOIN location from_loc  
		ON from_loc.id = channels.from_location_id 
	WHERE providers.name COLLATE utf8mb4_general_ci = chname; 
END//
DELIMITER ;

CALL getChannelInfo('provider "qui"'); 
