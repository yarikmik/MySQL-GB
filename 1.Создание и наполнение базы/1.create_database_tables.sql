-- создание новой базы данных
-- DROP DATABASE inventory;
-- CREATE DATABASE inventory;


-- 1.таблица устройств
CREATE TABLE devices (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  device_name VARCHAR(100) NOT NULL UNIQUE COMMENT "Имя устройства",
  -- INSERT INTO `table` (`ipv4`) VALUES (INET_ATON("127.0.0.1")) использовать для внесения ip адреса
  -- SELECT INET_NTOA(`ipv4`) FROM `table`; для вывода из таблицы в удобном формате
  ipv4 INT UNSIGNED UNIQUE COMMENT "ipv4 в виде целого числа, ",
  location_id INT UNSIGNED NOT NULL COMMENT "Ссылка на локацию, где размещено устройство",
  services_id INT UNSIGNED NOT NULL COMMENT "Ссылка на сервис\услугу устройства (сервис который обсесечивается устройством - почта, бд, лвс, 1С и т.п )",
  device_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип устройства",
  device_model_id INT UNSIGNED NOT NULL COMMENT "Ссылка на модель устройства",
  organisation_id INT UNSIGNED NOT NULL COMMENT "Ссылка на организацию владельца",
  status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на таблицу статусов для устройства",
  description TEXT NOT NULL COMMENT "Описание, комментарии для устройства",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Устройства";  

-- 2.таблица локаций
CREATE TABLE location (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  location_name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название локации"
) COMMENT "Локации, местоположение";  


-- 3.таблица типов устройств
CREATE TABLE device_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Тип устройства",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Локации, местоположение";  

-- 4.таблица моделей устройств
CREATE TABLE device_model (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Модель устройства",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Локации, местоположение";  

-- 5.таблица сервисов-услуг
CREATE TABLE services (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название сервиса",
  description TEXT COMMENT "Описание сервиса",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта группы",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Сервис\услуга";  

-- 6.таблица статусов для устройств
CREATE TABLE status (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статус оборудования (выведен из эксплуатации, в работе, в резерве и т.п)";  

-- 7.таблица организаций
CREATE TABLE organisation (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название организации",
  description TEXT COMMENT "Описание организации",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта организации",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон организации",
  contact_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя - контактное лицо ",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Организация";  

-- 8.таблица пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

-- 9. Таблица связи пользователей и сервисов
CREATE TABLE services_users (
  services_id INT UNSIGNED NOT NULL COMMENT "Ссылка на сервис\услугу в которую входит пользователь",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (services_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "Ответственные за услугу\сервис, связь между пользователями и услугами";

-- 10. Каналы связи
CREATE TABLE channels (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(250) NOT NULL UNIQUE COMMENT "Название канала",
  services_id INT UNSIGNED NOT NULL COMMENT "Ссылка на сервис\услугу",
  status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на таблицу статусов для канала",
  to_location_id INT UNSIGNED NOT NULL COMMENT "Ссылка на локацию, куда идет канал",
  from_location_id INT UNSIGNED NOT NULL COMMENT "Ссылка на локацию, откуда идет канал",
  provider_id INT UNSIGNED NOT NULL COMMENT "Ссылка на провайдера",
  description TEXT COMMENT "Описание канала",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статус оборудования (выведен из эксплуатации, в работе, в резерве и т.п)";  

-- 11.таблица провайдеров
CREATE TABLE providers (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL UNIQUE COMMENT "Название провайдера",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Провадеры";  

-- SELECT INET_NTOA('3232235876') FROM DUAL;