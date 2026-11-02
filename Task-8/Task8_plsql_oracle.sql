USE PlayStoreDB;
-- =======================================
-- level 0
-- ========================================

DELIMITER //
CREATE PROCEDURE calculate_discount(IN p_app_id INT)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_discount DECIMAL(10,2);
    SELECT Price INTO v_price
    FROM Apps
    WHERE AppID = p_app_id;
    SET v_discount = v_price * 0.10;
    SELECT v_price AS Original_Price,
           v_discount AS Ten_Percent_Discount;
END //
DELIMITER ;
CALL calculate_discount(1001);




DELIMITER //
CREATE PROCEDURE display_app_details(IN p_app_id INT)
BEGIN
    SELECT AppName, Rating, Price, Downloads
    FROM Apps
    WHERE AppID = p_app_id;
END //
DELIMITER ;
CALL display_app_details(1001);




DELIMITER //
CREATE PROCEDURE check_app_rating(IN p_app_id INT)
BEGIN
    DECLARE v_rating DECIMAL(3,2);
    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_app_id;
    IF v_rating >= 4.5 THEN
        SELECT 'Highly Rated' AS Category;
    ELSEIF v_rating >= 3.5 THEN
        SELECT 'Moderately Rated' AS Category;

    ELSE
        SELECT 'Low Rated' AS Category;
    END IF;
END //
DELIMITER ;
CALL check_app_rating(1001);





DELIMITER //
CREATE FUNCTION app_price_type(p_price DECIMAL(10,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF p_price > 0 THEN
        RETURN 'Paid Application';
    ELSE
        RETURN 'Free Application';
    END IF;
END //
DELIMITER ;
SELECT app_price_type(100);
SELECT AppName, Price,
       app_price_type(Price) AS Application_Type
FROM Apps;





DELIMITER //
CREATE PROCEDURE display_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        SELECT i AS Number;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;
CALL display_numbers();


-- =======================================
-- level 1
-- ======================================

DELIMITER //
CREATE PROCEDURE classify_application_rating(IN p_app_id INT)
BEGIN
    DECLARE v_rating DECIMAL(3,2);
    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_app_id;
    IF v_rating >= 4.5 THEN
        SELECT 'Excellent Application' AS Category;
    ELSEIF v_rating >= 4.0 THEN
        SELECT 'Good Application' AS Category;
    ELSEIF v_rating >= 3.5 THEN
        SELECT 'Average Application' AS Category;
    ELSE
        SELECT 'Low Rated Application' AS Category;
    END IF;
END //
DELIMITER ;
CALL classify_application_rating(1001);




DELIMITER //
CREATE FUNCTION get_app_rating(p_app_id INT)
RETURNS DECIMAL(3,2)
READS SQL DATA
BEGIN
    DECLARE v_rating DECIMAL(3,2);
    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_app_id;
    RETURN v_rating;
END //
DELIMITER ;
SELECT AppName,
       get_app_rating(AppID) AS Rating
FROM Apps;




-- =====================================
-- level 2
-- =======================================

DELIMITER //
CREATE PROCEDURE display_all_applications()
BEGIN
    DECLARE v_name VARCHAR(255);
    DECLARE v_rating DECIMAL(3,2);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_downloads BIGINT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE app_cursor CURSOR FOR
        SELECT AppName, Rating, Price, Downloads
        FROM Apps;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;
    OPEN app_cursor;
    read_loop: LOOP
        FETCH app_cursor
        INTO v_name, v_rating, v_price, v_downloads;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT v_name AS AppName,
               v_rating AS Rating,
               v_price AS Price,
               v_downloads AS Downloads;
    END LOOP;
    CLOSE app_cursor;
END //
DELIMITER ;
CALL display_all_applications();



DELIMITER //
CREATE PROCEDURE find_application(IN p_app_id INT)
BEGIN
    DECLARE v_name VARCHAR(255);
    DECLARE v_rating DECIMAL(3,2);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_not_found INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET v_not_found = 1;
    SELECT AppName, Rating, Price
    INTO v_name, v_rating, v_price
    FROM Apps
    WHERE AppID = p_app_id;
    IF v_not_found = 1 THEN
        SELECT 'Application not found' AS Message;
    ELSE
        SELECT v_name AS AppName,
               v_rating AS Rating,
               v_price AS Price;
    END IF;
END //
DELIMITER ;
CALL find_application(1001);
CALL find_application(9999);



select * from apps;
