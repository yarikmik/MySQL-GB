USE inventory;

SELECT * FROM deviсe_type dt ;

-- изменил названия типов устройств
UPDATE device_type SET name = 'Сервер' WHERE id = 1;
UPDATE device_type SET name = 'Коммутатор' WHERE id = 2;
UPDATE device_type SET name = 'Маршрутизатор' WHERE id = 3;
UPDATE device_type SET name = 'ИБП' WHERE id = 4;
UPDATE device_type SET name = 'СХД' WHERE id = 5;


-- подправил рандомные имена моделей, для наглядности
SELECT * FROM device_model dm ;
UPDATE device_model SET name=CONCAT('model is ', name);


-- подправил рандомные имена каналов, для наглядности
SELECT * FROM channels;
UPDATE channels SET name=CONCAT('Канал связи - ', name);


SELECT * FROM deviсes d ;
SELECT devise_name, INET_NTOA(ipv4) FROM devices;

-- исправил ошибку написания в столбцах и таблицах
RENAME TABLE devise_model TO device_model;
ALTER TABLE deviсes CHANGE devise_name device_name VARCHAR(100) NOT NULL UNIQUE COMMENT "Имя устройства";
ALTER TABLE deviсes CHANGE devise_type_id device_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип устройства";
ALTER TABLE deviсes CHANGE devise_model_id device_model_id INT UNSIGNED NOT NULL COMMENT "Ссылка на модель устройства";
DESC deviсes ;

-- убираю пробелы, обрезаю строку, добавляю рандомное число в имени устройств
SELECT * FROM deviсes d ;
SELECT CONCAT(LEFT(REPLACE(device_name, ' ', '' ), 10), '-',  LPAD(FLOOR(RAND()*(100-1)),3,'0')) FROM deviсes d ;
UPDATE deviсes SET device_name = CONCAT(LEFT(REPLACE(device_name, ' ', '' ), 10), '-',  LPAD(FLOOR(RAND()*(100-1)),3,'0'));

SELECT * FROM location;


-- для наглядности к названию организации добавил префикс
SELECT * FROM organisation o ;
SELECT ELT(0.5 + RAND() * 3, 'ООО', 'ПАО', 'ЗАО') FROM DUAL;
SELECT CONCAT(ELT(0.5 + RAND() * 3, 'ООО', 'ПАО', 'ЗАО'), ' "',name, '"') FROM organisation;
UPDATE organisation SET name = CONCAT(ELT(0.5 + RAND() * 3, 'ООО', 'ПАО', 'ЗАО'), ' "',name, '"');

-- для наглядности добавил обозначение провайдера
SELECT * FROM providers;
SELECT CONCAT('provider', ' "',name, '"') FROM providers p ;
UPDATE providers SET name = CONCAT('provider', ' "',name, '"');



-- для наглядности изменил имена служб и сервисов
SELECT * FROM services;
UPDATE services SET name = 'Cеть' WHERE id = 1;
UPDATE services SET name = 'Инженерное оборудование' WHERE id = 2;
UPDATE services SET name = 'Серверное оборудование' WHERE id = 3;
UPDATE services SET name = 'Почтовые службы' WHERE id = 4;
UPDATE services SET name = 'Службы каталога' WHERE id = 5;
UPDATE services SET name = 'Файловый сервис' WHERE id = 6;
UPDATE services SET name = 'Каналы передачи данных' WHERE id = 7;
UPDATE services SET name = 'Доставка рабочих столов' WHERE id = 8;
UPDATE services SET name = 'Интернет' WHERE id = 9;
UPDATE services SET name = 'Межсетевой доступ' WHERE id = 10;
UPDATE services SET name = 'Базы данных' WHERE id = 11;
UPDATE services SET name = 'Системы хранения данных' WHERE id = 12;
UPDATE services SET name = 'АСУТП' WHERE id = 13;
UPDATE services SET name = 'SAP' WHERE id = 14;
UPDATE services SET name = 'Доставка приложений' WHERE id = 15;
UPDATE services SET name = CONCAT('Тестовая услуга-', LPAD(FLOOR(RAND()*(6-1)),3,'0')) WHERE id > 15;


-- для наглядности изменил имена статусов оборудования
SELECT * FROM status s2 ;
UPDATE status SET name = 'В работе' WHERE id = 1;
UPDATE status SET name = 'Ожидает ремонта' WHERE id = 2;
UPDATE status SET name = 'В резерве' WHERE id = 3;
UPDATE status SET name = 'На складе' WHERE id = 4;
UPDATE status SET name = 'Снято с эксплуатации' WHERE id = 5;
UPDATE status SET name = CONCAT('Тестовый статус-', LPAD(FLOOR(RAND()*(6-1)),3,'0')) WHERE id > 5;


SELECT * FROM users u ;




