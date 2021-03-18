-- представление вывода по по расположению имени и модели устройства

USE inventory;
CREATE OR REPLACE VIEW view_loc_model (location, name, model) 
AS SELECT location.location_name, deviсes.device_name , device_model.name 
  FROM deviсes JOIN device_model
    ON deviсes.device_model_id = device_model.id
 JOIN location
    ON deviсes.location_id = location.id
  ORDER BY location.location_name; 
    
SELECT * FROM view_loc_model;



-- представление по каналам связи: провайдер, имя, статус, откуда и куда идет
CREATE OR REPLACE VIEW view_providers_summ_info (provider, channel, status, from_location, to_location) 
  AS SELECT providers.name, channels.name, status.name, 
    (SELECT location_name FROM location WHERE location.id = channels.from_location_id) AS from_location, 
    (SELECT location_name FROM location WHERE location.id = channels.to_location_id) AS to_location
  FROM providers JOIN channels
    ON channels.provider_id = providers.id
      JOIN status
    ON channels.status_id = status.id
      JOIN location
  GROUP BY channels.name
  ORDER BY channels.name; 
  
 SELECT * FROM view_providers_summ_info;