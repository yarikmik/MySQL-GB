DELIMITER //
DROP PROCEDURE IF EXISTS hello//
CREATE PROCEDURE hello()
BEGIN
  DECLARE hh INT;
  SET hh = EXTRACT(HOUR FROM CURRENT_TIME());
  	IF(hh >=6 AND hh < 12) THEN
		SELECT CURRENT_TIME() AS 'time', 'Доброе утро' AS day_time;
	ELSEIF(hh >= 12 AND hh < 18) THEN
		SELECT CURRENT_TIME() AS 'time', 'Добрый день' AS day_time;
	ELSEIF(hh >= 18) THEN
		SELECT CURRENT_TIME() AS 'time', 'Добрый вечер' AS day_time;
	ELSE
		SELECT CURRENT_TIME() AS 'time', 'Доброй ночи' AS day_time;
	END IF;
END//

DELIMITER ;
CALL hello();