-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT * FROM users;
SELECT * FROM orders;


UPDATE orders SET user_id = NULL WHERE user_id = 6;

SELECT id FROM orders WHERE user_id IS NOT NULL;

SELECT * FROM users JOIN orders;

SELECT name FROM users JOIN orders  ON users.id = orders.user_id GROUP BY name;



-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT * FROM products;
SELECT * FROM catalogs;

SELECT products.name, catalogs.id, catalogs.name FROM products, catalogs;


-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  flig_from VARCHAR(255) COMMENT 'Откуда',
  flig_to VARCHAR(255) COMMENT 'Куда'
) COMMENT = 'Таблица рейсов';

INSERT INTO flights
  (flig_from, flig_to)
VALUES
  ('moskow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moskow'),
  ('omsk', 'irkutsk'),
  ('moskow', 'kazan');
 
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT 'Английский вариан',
  name VARCHAR(255) COMMENT 'Русский вариант'
) COMMENT = 'Таблица соответствия';

INSERT INTO cities
  (label, name)
VALUES
  ('moskow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
 
 
SELECT * FROM flights;
SELECT * FROM cities;



SELECT id,
(SELECT name FROM cities WHERE label = flights.flig_from) AS 'from',
(SELECT name FROM cities WHERE label = flights.flig_to) AS 'to'
FROM  flights
ORDER BY id;




