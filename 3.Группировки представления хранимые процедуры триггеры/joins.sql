
-- всего оборудования на сервис, процент оборудования на сервис, всего устройств, всего сервисов, контактная почта группы
SELECT DISTINCT
  services.id, services.name AS service_name,
  COUNT(deviсes.id) OVER w_deices AS device_in_service, 
  COUNT(deviсes.id) OVER w_deices / (SELECT COUNT(*) FROM deviсes) *100 AS '%%',
  services.email AS services_email,
  total_deviсes, total_services
  FROM 
    (SELECT COUNT(*) AS total_deviсes FROM deviсes) AS td
  	CROSS JOIN (SELECT COUNT(*) AS total_services FROM services) AS ts
  	CROSS JOIN services
    LEFT JOIN deviсes
    ON deviсes.services_id = services.id
   WINDOW w_deices AS (PARTITION BY services.id);
    
    
            
-- провайдеры, колличество каналов, всего каналов
SELECT DISTINCT providers.name,
    COUNT(channels.id) OVER (PARTITION BY providers.id) AS channels_count, providers.email, providers.phone, 
    total_channels
FROM 
    (SELECT COUNT(*) AS total_channels FROM channels) AS tc
    CROSS JOIN providers
    LEFT JOIN channels
    ON channels.provider_id = providers.id;
