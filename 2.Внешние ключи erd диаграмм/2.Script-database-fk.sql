DESC channels;
-- каналы связи
ALTER TABLE channels
  ADD CONSTRAINT channels_services_id_fk 
    FOREIGN KEY (services_id) REFERENCES services(id),
  ADD CONSTRAINT channels_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES status(id),
  ADD CONSTRAINT channels_to_location_id_fk 
    FOREIGN KEY (to_location_id) REFERENCES location(id),
  ADD CONSTRAINT channels_from_location_id_fk 
    FOREIGN KEY (from_location_id) REFERENCES location(id),
  ADD CONSTRAINT channels_provider_id_fk 
    FOREIGN KEY (provider_id) REFERENCES providers(id)
ON DELETE SET NULL; -- при удалении какого нибудь элемента значение принимает NULL

    
    
DESC deviсes ;

-- устройства
ALTER TABLE deviсes
  ADD CONSTRAINT deviсes_location_id_fk 
    FOREIGN KEY (location_id) REFERENCES location(id),
  ADD CONSTRAINT deviсes_services_id_fk 
    FOREIGN KEY (services_id) REFERENCES services(id),
  ADD CONSTRAINT deviсes_device_type_id_fk 
    FOREIGN KEY (device_type_id) REFERENCES deviсe_type(id),
  ADD CONSTRAINT deviсes_device_model_id_fk 
    FOREIGN KEY (device_model_id) REFERENCES device_model(id),
  ADD CONSTRAINT deviсes_organisation_id_fk 
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
  ADD CONSTRAINT deviсes_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES status(id)
ON DELETE SET NULL; -- при удалении какого нибудь элемента значение принимает NULL


DESC services_users ;
-- услуги и пользователи
ALTER TABLE services_users
  ADD CONSTRAINT services_users_services_id_fk 
    FOREIGN KEY (services_id) REFERENCES services(id),
  ADD CONSTRAINT services_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
ON DELETE CASCADE; -- при удалении любого элемента строка удаляется
    
    
    
    
    