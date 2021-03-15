-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT * FROM profiles;
SELECT gender, COUNT(*) as total FROM profiles 
GROUP BY
  gender
ORDER BY
  total DESC;
  
 
SELECT * FROM likes;

SELECT id, user_id FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'M');
SELECT user_id, gender FROM profiles WHERE gender = 'F';

-- 1
SELECT * FROM profiles;
SELECT gender, 
  ((SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender ='F'))
  UNION 
  (SELECT COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender ='M'))) as total FROM profiles 
GROUP BY
  gender
ORDER BY
  total DESC;

-- 2
(SELECT 'F',  COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'F'))
UNION ALL
(SELECT 'M',  COUNT(id) FROM likes WHERE user_id IN (SELECT user_id FROM profiles WHERE gender = 'M'));

-- 3


-- 4. Подсчитать общее количество лайков десяти самым молодым пользователям (сколько лайков получили 10 самых молодых пользователей).

SELECT * FROM profiles;
SELECT user_id, birthday FROM profiles ORDER BY birthday DESC LIMIT 10;-- Самые молодые пользоваетли

SELECT * FROM likes ORDER BY user_id ;

SELECT id, user_id FROM likes ORDER BY user_id ;
SELECT COUNT(id) AS like_count, user_id FROM likes GROUP BY user_id ORDER BY user_id ;

SELECT COUNT(id) AS like_count, user_id, (SELECT first_name FROM users WHERE id=likes.user_id) AS name,
(SELECT birthday FROM profiles WHERE user_id=likes.user_id) AS birthday 
  FROM likes 
  GROUP BY user_id 
  ORDER BY birthday DESC LIMIT 10;
 
 -- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
 
 
 SELECT * FROM communities;

-- вариант с сортировкой по всем столбцам активностей пользователя
 SELECT id, first_name,
  (SELECT COUNT(id) FROM likes WHERE user_id=users.id) AS likes_count,
  (SELECT COUNT(id) FROM media WHERE user_id=users.id) AS media_files_count,
  (SELECT COUNT(id) FROM posts WHERE user_id=users.id) AS posts_count,
  (SELECT COUNT(id) FROM communities WHERE owner_id=users.id) AS communities_count
  FROM users
  ORDER BY likes_count , media_files_count , communities_count  LIMIT 10;
 
 -- вариант сортировке по сумме всех активностей пользователя
  SELECT id, first_name,
  (SELECT COUNT(id) FROM likes WHERE user_id=users.id)+
  (SELECT COUNT(id) FROM media WHERE user_id=users.id)+
  (SELECT COUNT(id) FROM posts WHERE user_id=users.id)+
  (SELECT COUNT(id) FROM communities WHERE owner_id=users.id) AS all_count
   FROM users
 ORDER BY all_count LIMIT 10;

SELECT * FROM likes;
SELECT * FROM media;
 



