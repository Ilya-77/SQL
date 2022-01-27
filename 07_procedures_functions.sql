-- Check user by id
DROP FUNCTION IF EXISTS is_user_by_id_exists;
DELIMITER //
CREATE FUNCTION is_user_by_id_exists (user_id INT)
RETURNS BOOLEAN READS SQL DATA
BEGIN
  RETURN EXISTS(SELECT 1 FROM users WHERE id = user_id);
END//

DELIMITER ;

-- Get user info by id
DROP PROCEDURE IF EXISTS get_user_profile_by_user_id;
DELIMITER //
CREATE PROCEDURE get_user_info_by_id(id INT)
BEGIN
	SELECT * FROM profiles AS p WHERE p.user_id = id;
END //
DELIMITER ;
