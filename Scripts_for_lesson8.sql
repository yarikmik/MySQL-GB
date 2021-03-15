-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
   
 SELECT gender, COUNT(gender) AS total
  FROM profiles JOIN likes
  ON profiles.user_id = likes.user_id
    GROUP BY gender
    ORDER BY total DESC;
    
   

-- 4. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- Смотрим типы для лайков
SELECT * FROM target_types;

-- Выбираем профили с сортировкой по дате рождения
SELECT * FROM profiles ORDER BY birthday DESC LIMIT 10;

-- Выбираем количество лайков по условию
SELECT 
  (SELECT COUNT(*) FROM likes WHERE target_id = profiles.user_id AND target_type_id = 2) AS likes_total, user_id ,birthday
  FROM profiles 
  ORDER BY birthday 
  DESC LIMIT 10;
 
-- вариант с join
SELECT * from likes l ;
SELECT user_id, birthday from profiles ORDER BY birthday DESC LIMIT 10 ;


SELECT * 
  FROM likes RIGHT JOIN  profiles.
  ON likes.target_id = profiles.user_id AND target_type_id = 2
  ORDER BY birthday 
  DESC LIMIT 10;
 
  SELECT COUNT(likes.user_id) AS likes_total, profiles.user_id
    FROM likes RIGHT JOIN  profiles
    ON likes.target_id = profiles.user_id AND target_type_id = 2
    GROUP BY profiles.user_id
    ORDER BY birthday 
    DESC LIMIT 10;

   -- сумма
SELECT SUM(likes_total) FROM (
  SELECT COUNT(likes.user_id) AS likes_total, profiles.user_id
    FROM likes RIGHT JOIN  profiles
    ON likes.target_id = profiles.user_id AND target_type_id = 2
    GROUP BY profiles.user_id
    ORDER BY birthday 
    DESC LIMIT 10) AS user_likes;
   
   
     -- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной 
-- сети.     
SELECT 
  CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
	  FROM users
	  ORDER BY overall_activity
	  LIMIT 10;
	 
	 
SELECT *
  FROM users
    JOIN likes
      ON likes.user_id = users.id
    JOIN media
      ON media.user_id = users.id
    JOIN messages
      ON messages.from_user_id = users.id;
    
    --    
SELECT CONCAT(first_name, ' ', last_name) AS users_name,
COUNT(likes.user_id) + COUNT(media.user_id) + COUNT(messages.from_user_id) AS overall_activity
  FROM users
    JOIN likes
      ON likes.user_id = users.id
    JOIN media
      ON media.user_id = users.id
    JOIN messages
      ON messages.from_user_id = users.id
  GROUP BY users_name
  ORDER BY overall_activity
  LIMIT 10;
 
 
 SELECT CONCAT(first_name, ' ', last_name) AS users, 
  COUNT(DISTINCT(likes.id)) +
  COUNT(DISTINCT(media.id)) +
  COUNT(DISTINCT(messages.id)) AS overall_activity
  FROM users
    LEFT JOIN likes
      ON likes.user_id = users.id
    LEFT JOIN media
      ON media.user_id = users.id
    LEFT JOIN messages
      ON messages.from_user_id = users.id
  GROUP BY users
  ORDER BY overall_activity
  LIMIT 10;
	 
	 
     
     
