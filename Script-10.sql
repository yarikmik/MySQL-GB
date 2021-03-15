
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый старший пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100

SELECT * FROM profiles;
SELECT * FROM communities;
SELECT * FROM communities_users ORDER BY user_id;
SELECT * FROM users;
DESC communities_users;


 -- AVG(media.size) OVER(PARTITION BY communities.name) AS avg_members, 
 -- SUM(media.size) OVER(PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
 
SELECT COUNT(user_id), community_id FROM communities_users GROUP BY community_id;
SELECT COUNT(*) FROM communities_users;


  
  SELECT DISTINCT communities.name,
   FLOOR((SELECT COUNT(*) FROM communities_users)/(SELECT COUNT(*) FROM communities)) avg_members,
   MIN(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS youngest_user, 
   MAX(profiles.birthday) OVER (PARTITION BY communities_users.community_id) AS oldest_user, 
   COUNT(*) OVER(PARTITION BY communities_users.community_id) AS users_in_community, 
   (SELECT COUNT(*) FROM communities_users) AS all_users_count, 
   (COUNT(*) OVER(PARTITION BY communities_users.community_id) / (SELECT COUNT(*) FROM communities_users) *100 ) percent
   FROM communities_users JOIN profiles
   ON communities_users.user_id = profiles.user_id
   LEFT JOIN communities
   ON communities.id = communities_users.community_id;
