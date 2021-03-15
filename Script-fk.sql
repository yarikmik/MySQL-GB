-- Смотрим структуру таблицы
DESC profiles;

-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

-- Изменяем тип столбца при необходимости
ALTER TABLE profiles DROP FOREIGN KEY profiles_user_id_fk;
ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;
      
-- Для таблицы сообщений

-- Смотрим структурв таблицы
DESC messages;

-- Добавляем внешние ключи
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

-- Смотрим диаграмму отношений в DBeaver (ERDiagram)

   
   -- Если нужно удалить
ALTER TABLE table_name DROP FOREIGN KEY constraint_name;


-- Начало ДЗ:
-- communities
DESC communities ;

ALTER TABLE communities MODIFY owner_id INT UNSIGNED;
ALTER TABLE communities
  ADD CONSTRAINT communities_owner_id_fk
    FOREIGN KEY (owner_id) REFERENCES users(id)
      ON DELETE SET NULL; -- при удалении пользователя владелец сообщества становится неопределен, но сообщество остается
      
      
-- communities_users   
DESC communities_users;
TRUNCATE TABLE communities_users;
SELECT * FROM communities_users;

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id);

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id); -- ошибка Cannot add or update a child row, пришлось очистить таблицу
    
-- media
DESC media;
SELECT * FROM media;
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id);   
   
-- posts
DESC posts;
SELECT * FROM posts;
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id),   
  ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id);
    
   
-- friendship
DESC friendship;
SELECT * FROM friendship;
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users(id),  
  ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id);  
   
   
-- likes
DESC target_types;
DESC likes;
SELECT * FROM likes;
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
-- непонятно к чему привязывать target_id
   