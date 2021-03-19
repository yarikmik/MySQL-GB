SELECT * FROM deviсes d2 ;
SELECT d.device_name, l.location_name, s.name, st.name 
     FROM deviсes d, location l, services s, status st WHERE d.device_name = 'Velitfugia-031' AND l.id = d.location_id AND s.id = d.services_id AND st.id = d.status_id;

CALL getDeviceInfo('Totamenimu-055'); 

SELECT * FROM providers p2 ;
SELECT * FROM channels c ;

SELECT DISTINCT channels.name AS channels, providers.name AS providers, to_loc.location_name,from_loc.location_name 
	FROM channels
		JOIN providers
		ON channels.provider_id = providers.id 
		JOIN location to_loc 
		ON to_loc.id = channels.to_location_id 		
		JOIN location from_loc  
		ON from_loc.id = channels.from_location_id 
	WHERE providers.name = 'provider "asperiores"';



CALL getChannelInfo('provider "qui"'); 