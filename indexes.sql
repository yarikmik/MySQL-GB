CREATE INDEX profiles_birthday_idx ON profiles(birthday);
DROP INDEX email ON users;
CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE INDEX messages_from_user_id_to_user_id_idx ON messages (from_user_id, to_user_id);

-- индекс на фамилию
CREATE  INDEX users_last_name_idx ON users(last_name);

-- пересоздал индекс на телефон
DROP INDEX phone ON users;
CREATE UNIQUE INDEX users_phone_uq ON users(phone);

-- индекс на имя файла
CREATE INDEX media_filename_idx ON media(filename);

-- индекс на имя сообщества
DROP INDEX name ON communities;
CREATE UNIQUE INDEX communities_name_uq ON communities(name);


SELECT * FROM communities;
SHOW INDEX FROM communities;
