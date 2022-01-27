-- USER first name and last name validation

DELIMITER //
CREATE TRIGGER validate_users_first_name_last_name_insert BEFORE INSERT ON profiles
FOR EACH ROW BEGIN
  IF NEW.first_name IS NULL AND NEW.last_name IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both fist name and last name are NULL';
  END IF;
END//
DELIMITER ;

-- Phone number validation
DELIMITER //
CREATE TRIGGER validate_phone_number_insert BEFORE INSERT ON profiles
FOR EACH ROW BEGIN
  IF NEW.phone < 79000000 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Phone is incorrect';
  END IF;
END//
DELIMITER ;

-- Country validation
DELIMITER //
CREATE TRIGGER validate_country_insert BEFORE INSERT ON profiles
FOR EACH ROW BEGIN
  IF NEW.country IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Country is NULL';
  END IF;
END//
DELIMITER ;


-- Product name validation
DELIMITER //
CREATE TRIGGER validate_product_name_insert BEFORE INSERT ON goods
FOR EACH ROW BEGIN
  IF NEW.name IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Product name is NULL';
  END IF;
END//
DELIMITER ;


-- Users first name and last name validation
DELIMITER //
CREATE TRIGGER validate_users_user_name_email_insert BEFORE INSERT ON users
FOR EACH ROW BEGIN
  IF NEW.user_name IS NULL OR NEW.email IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User name or email are NULL';
  END IF;
END//
DELIMITER ;
