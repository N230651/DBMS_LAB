use playstoredb;
-- =============================
-- all tables
-- ============================
select *from Developers;
select *from Publishers;
select *from categories;
select *from apps;

-- ====================================
-- Level 1
-- ===================================
CREATE OR REPLACE VIEW All_Apps AS
SELECT *FROM Apps;
SELECT * FROM All_Apps;


CREATE OR REPLACE VIEW App_Basic_Details AS
SELECT AppID, AppName, Rating, Price
FROM Apps;
SELECT * FROM App_Basic_Details;


CREATE OR REPLACE VIEW Highly_Rated_Apps AS
SELECT *
FROM Apps
WHERE Rating >= 4.5;
SELECT * FROM Highly_Rated_Apps;



CREATE OR REPLACE VIEW Free_Apps AS
SELECT *FROM Apps
WHERE Price = 0;
SELECT * FROM Free_Apps;



SELECT *FROM Highly_Rated_Apps;



SHOW FULL TABLES
WHERE Table_type = 'VIEW';


-- ==========================================
-- LEVEL 2 
-- ==========================================


CREATE OR REPLACE VIEW App_Developer_View AS
SELECT A.AppName, D.DeveloperName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM App_Developer_View;



CREATE OR REPLACE VIEW App_Publisher_View AS
SELECT A.AppName, P.PublisherName
FROM Apps A
JOIN Publishers P
ON A.PublisherID = P.PublisherID;
SELECT * FROM App_Publisher_View;



CREATE OR REPLACE VIEW App_Category_View AS
SELECT A.AppName, C.CategoryName
FROM Apps A
JOIN Categories C
ON A.CategoryID = C.CategoryID;
SELECT * FROM App_Category_View;



CREATE OR REPLACE VIEW App_Developer_Country AS
SELECT A.AppID, A.AppName, A.Rating,
       D.DeveloperName, D.Country
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM App_Developer_Country;



CREATE OR REPLACE VIEW Category_App_Count AS
SELECT CategoryID,
       COUNT(*) AS Total_Applications
FROM Apps
GROUP BY CategoryID;
SELECT * FROM Category_App_Count;



CREATE OR REPLACE VIEW Developer_App_Count AS
SELECT DeveloperID,
       COUNT(*) AS Total_Applications
FROM Apps
GROUP BY DeveloperID;
SELECT * FROM Developer_App_Count;



CREATE OR REPLACE VIEW Category_Avg_Rating AS
SELECT CategoryID,
       AVG(Rating) AS Average_Rating
FROM Apps
GROUP BY CategoryID;
SELECT * FROM Category_Avg_Rating;



CREATE OR REPLACE VIEW Apps_Rating_Above_43 AS
SELECT A.AppName, A.Rating, D.DeveloperName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID
WHERE A.Rating > 4.3;
SELECT * FROM Apps_Rating_Above_43;



SELECT AppName, DeveloperName
FROM App_Developer_View
WHERE DeveloperName IS NOT NULL;



SHOW CREATE VIEW App_Developer_View;


-- ==========================================
-- LEVEL 3 
-- ==========================================


CREATE OR REPLACE VIEW Category_Count_Details AS
SELECT C.CategoryName,
       COUNT(A.AppID) AS Total_Applications
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;
SELECT * FROM Category_Count_Details;



CREATE OR REPLACE VIEW Developers_Multiple_Apps AS
SELECT D.DeveloperID, D.DeveloperName,
       COUNT(A.AppID) AS Total_Applications
FROM Developers D
JOIN Apps A
ON D.DeveloperID = A.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName
HAVING COUNT(A.AppID) > 1;
SELECT * FROM Developers_Multiple_Apps;



CREATE OR REPLACE VIEW Category_Rating_Range AS
SELECT C.CategoryName,
       MAX(A.Rating) AS Highest_Rating,
       MIN(A.Rating) AS Lowest_Rating
FROM Categories C
JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;
SELECT * FROM Category_Rating_Range;



CREATE OR REPLACE VIEW Developer_Total_Apps AS
SELECT D.DeveloperName,
       COUNT(A.AppID) AS Total_Applications
FROM Developers D
LEFT JOIN Apps A
ON D.DeveloperID = A.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName;
SELECT * FROM Developer_Total_Apps;



CREATE OR REPLACE VIEW Complete_App_Details AS
SELECT A.AppID, A.AppName,
       D.DeveloperName,
       P.PublisherName,
       C.CategoryName,
       A.Rating, A.Price, A.Downloads
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID
JOIN Publishers P
ON A.PublisherID = P.PublisherID
JOIN Categories C
ON A.CategoryID = C.CategoryID;
SELECT * FROM Complete_App_Details;



CREATE OR REPLACE VIEW Highly_Rated_App_Details AS
SELECT A.AppName, A.Rating,
       D.DeveloperName, C.CategoryName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID
JOIN Categories C
ON A.CategoryID = C.CategoryID
WHERE A.Rating >= 4.5;
SELECT * FROM Highly_Rated_App_Details;




CREATE OR REPLACE VIEW Publisher_App_Stats AS
SELECT P.PublisherName,
       COUNT(A.AppID) AS Total_Applications,
       COALESCE(SUM(A.Downloads), 0) AS Total_Downloads
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID
GROUP BY P.PublisherID, P.PublisherName;
SELECT * FROM Publisher_App_Stats;


SELECT *
FROM Complete_App_Details
WHERE Rating >= 4.5
ORDER BY Downloads DESC;



CREATE OR REPLACE VIEW App_Rating_View AS
SELECT AppID, AppName, Rating
FROM Apps;
UPDATE App_Rating_View
SET Rating = 4.8
WHERE AppID = 1008;

-- Verify changes
SELECT * FROM App_Rating_View;
SELECT * FROM Apps;



DROP VIEW App_Rating_View;
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
