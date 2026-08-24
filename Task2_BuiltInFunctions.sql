USE PlayStoreDB;

-- ================================
-- LEVEL 0
-- ===============================
SELECT UPPER(DeveloperName)
FROM Developers;

SELECT LOWER(DeveloperName)
FROM Developers;

SELECT LENGTH(AppName)
FROM Apps;

SELECT CategoryName , length(categoryName)
FROM Categories;

SELECT current_date();
SELECT current_time();

SELECT ROUND(Rating,0) 
FROM Apps;

-- ===========================
-- LEVEL 1
-- ==========================
SELECT SUBSTRING(AppName,1,5)
FROM Apps;

SELECT CONCAT(DeveloperName,  '  '   ,Country)
FROM Developers;

SELECT ROUND(Rating,1)
FROM Apps;

SELECT CEIL(Price)
FROM Apps;

SELECT DeveloperName,foundedYear
FROM Developers;

SELECT CAST(Downloads AS CHAR)
FROM Apps;

-- ================================
-- level 2
-- ==============================
SELECT UPPER(AppName),Rating
FROM Apps;

SELECT SUBSTRING(CategoryName,1,3)
FROM Categories;

SELECT AppName,Price,ABS(Price-200)
FROM Apps;

SELECT DEVELOPERNAME,LENGTH(DEVELOPERNAME)
FROM DEVELOPERS;

SELECT CURRENT_DATE();
SELECT current_timestamp();

SELECT CAST(13345678 AS CHAR)
Numeric_As_Character;